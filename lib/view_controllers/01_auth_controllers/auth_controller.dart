import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/views/03_admin/admin_home.dart';
import '../../helpers/globals.dart' as globals;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../views/widgets/components.dart';
import '../../models/user_model.dart';
import '../../helpers/cache_helper.dart';
import '../../views/01_auth/login_screen.dart';
import '../../views/02_user/home_screen.dart';

class AuthController extends GetxController {
// ThemeMode appMode =ThemeMode.dark;

  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;
  bool isLoadingReset = false;
  bool isLoadingLogin = false;
  bool isLoadingGetUserData = false;
  bool isLoadingRegister = false;
  AppUserModel? userModel;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final twitterController = TextEditingController();

  changeIsLoadingLoginState(bool state) {
    isLoadingLogin = state;
    update();
  }

  changeIsLoadingGetUserDataState(bool state) {
    isLoadingGetUserData = state;
    update();
  }

  changeIsLoadingRegisterState(bool state) {
    isLoadingRegister = state;
    update();
  }

  changeIsLoadingResetState(bool state) {
    isLoadingReset = state;
    update();
  }

  changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    update();
  }
  File? profileImage;

  var picker = ImagePicker();

  uploadProfileImage(profileImage) async {
    String path = 'profile_pic-${DateTime.now()}';
    if(kDebugMode) print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('profile_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    if(kDebugMode) print(imageUrl);
    return imageUrl;

  }

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {
      if(kDebugMode) print('no image selected');
    }

    update();
  }


  Future<void> userLogin(
    context, {
    required String email,
    required String password,
  }) async {
    try {
      changeIsLoadingLoginState(true);
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      //  print('/// UID: ${credential.user!.uid}');

      /// Success
      AppUserModel? user = await getUserData(uId: credential.user!.uid);

      //  print('/// NAME: ${user?.name}');
      //  print('/// ADMIN: ${user?.admin}');
      //  print('/// EMAIL: ${user?.email}');

      if (user!.admin != null) {
        await CacheHelper.saveData(key: 'admin', value: user.admin);
        globals.isAdmin = user.admin;
      }
      if (user.uId != null) {
        await CacheHelper.saveData(key: 'uId', value: credential.user!.uid);
        globals.uId = user.uId;
        //  print (credential.user!.uid);
      }

      navigate(user.admin!);

      changeIsLoadingLoginState(false);
    } on Exception catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingLoginState(false);
    }
  }

  navigate(bool isAdmin) {
    isAdmin ? Get.offAll(AdminHome()) : Get.offAll(HomeScreen());
  }

  getUserData({String? uId}) async {
    try {
      changeIsLoadingGetUserDataState(true);
      DocumentSnapshot? snapshot = await FirebaseFirestore.instance.collection('users').doc(uId).get();
      userModel = AppUserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
      changeIsLoadingGetUserDataState(false);
      //  print('/// NAME1: ${userModel?.name}');
      //  print('/// ADMIN1: ${userModel?.admin}');
      //   print('/// EMAIL1: ${userModel?.email}');
      return userModel;
    } catch (e, stacktrace) {
      showToast(text: e.toString(), state: ToastStates.error);
     // print(e);
   //   print(stacktrace);
      changeIsLoadingGetUserDataState(false);
    }
  }
// Future <bool> getEmail()async{
//  await FirebaseFirestore.instance.collection('emails').get().then((value) {
//    List <String> emails =[] ;
//    for(var item in value.docs){
//      emails.add(item())
//    }
//     });
//  }

  void userRegister({
    required String name,
    required String age,
    required String email,
    required String password,
    required String twitter,
    String? imageUrl,
  }) async {
    changeIsLoadingRegisterState(true);
    if (profileImage != null) {        ///CHANGE
      imageUrl = await uploadProfileImage(profileImage);
    }
    else {
     //////////// photo
      imageUrl = 'https://esquimaltmfrc.com/wp-content/uploads/2015/09/flat-faces-icons-circle-man-6.png';
    }
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((UserCredential value) {
      userCreate(
        name: name,
        age: age,
        email: email,
        twitter: twitter,
        uId: value.user!.uid,
        image: imageUrl,
      );
      // CacheHelper.saveData(key: 'uId', value: value.02_user!.uid);
    }).catchError((e) {
      // print(e.toString());
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingRegisterState(false);
    });
  }

  void userCreate({
    required String name,
    required String age,
    required String email,
    required String twitter,
    required String uId,
    String? image,
  }) async {
    AppUserModel model = AppUserModel(
      email: email,
      name: name,
      age: age,
      twitter: twitter,
      uId: uId,
      isEmailVerified: false,
      admin: false,
      image: image,
    );

    print(model.email);
    await FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
      globals.uId = uId;
      Get.offAll(HomeScreen());

      showToast(text: 'Register Success!', state: ToastStates.success);
    }).catchError((e) {
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingRegisterState(false);
    });
  }

  //////////////////////////////
  void resetPassword({required String Email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: Email).then((value) {
      Get.offAll(LoginScreen());

      showToast(text: 'check your email to change password', state: ToastStates.success);
    }).catchError((e) {
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingResetState(false);
    });
  }

////////////////////////////////

///////////////////////////////////////
  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    navigateAndFinish(context, LoginScreen());
  }

  @override
  void onInit() {
    isLoadingReset = false;
    isLoadingLogin = false;
    isLoadingGetUserData = false;
    isLoadingRegister = false;
    nameController.text = '';
    ageController.text = '';
    emailController.text = '';
    passwordController.text = '';
    twitterController.text = '';
    super.onInit();
  }
}

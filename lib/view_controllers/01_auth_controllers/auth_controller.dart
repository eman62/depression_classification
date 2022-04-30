import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/views/03_admin/admin_home_layout.dart';
import '../../helpers/globals.dart';
import '../../models/post_model.dart';
import '../../views/widgets/components.dart';
import '../../models/user_model.dart';
import '../../helpers/cache_helper.dart';
import '../../views/01_auth/login_screen.dart';
import '../../views/02_user/home_screen.dart';

class AuthController extends GetxController {
  bool isDark = false;
// ThemeMode appMode =ThemeMode.dark;

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  bool isLoadingLogin = false;
  bool isLoadingGetUserData = false;
  bool isLoadingRegister = false;
  AppUserModel? userModel;

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

  changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark);
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

      print('/// UID: ${credential.user!.uid}');

      /// Success
      AppUserModel? user = await getUserData(uId: credential.user!.uid);

      print('/// NAME: ${user?.name}');
      print('/// ADMIN: ${user?.admin}');
      print('/// EMAIL: ${user?.email}');

      if (user!.admin != null) {
        await CacheHelper.saveData(key: 'admin', value: user.admin);
        isAdmin = user.admin;
      }
      if (user.uId != null) {
        await CacheHelper.saveData(key: 'uId', value: credential.user!.uid);
        uId = user.uId;
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
      print('/// NAME1: ${userModel?.name}');
      print('/// ADMIN1: ${userModel?.admin}');
      print('/// EMAIL1: ${userModel?.email}');
      return userModel;
    } catch (e, stacktrace) {
      showToast(text: e.toString(), state: ToastStates.error);
      print(e);
      print(stacktrace);
      changeIsLoadingGetUserDataState(false);
    }
  }

  void userRegister({
    required String name,
    required String phone,
    required String age,
    required String email,
    required String password,
    required String twitter,
  }) async {
    changeIsLoadingRegisterState(true);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(name: name, phone: phone, age: age, email: email, twitter: twitter, uId: value.user!.uid);
      // CacheHelper.saveData(key: 'uId', value: value.02_user!.uid);
    }).catchError((e) {
      print(e.toString());
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingRegisterState(false);
    });
  }

////////////////////////////////
  void userCreate({
    required String name,
    required String phone,
    required String age,
    required String email,
    required String twitter,
    required String uId,
  }) async {
    AppUserModel model = AppUserModel(
      email: email,
      name: name,
      phone: phone,
      age: age,
      twitter: twitter,
      uId: uId,
      image: 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
      isEmailVerified: false,
      admin: false,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {})
        .catchError((e) {
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingRegisterState(false);
    });
  }

///////////////////////////////////////
  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    navigateAndFinish(context, SocialLoginScreen());
  }
}
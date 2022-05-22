import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/models/post_model.dart';
import '../../helpers/cache_helper.dart';
import '../../helpers/globals.dart';
import '../../models/feedback_model.dart';
import '../../models/user_model.dart';
import '../../views/01_auth/login_screen.dart';
import '../../views/widgets/components.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AdminController extends GetxController {
  List<FeedbackModel> feedback = [];
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<AppUserModel> users = [];
  AppUserModel? userModel;
  int userCount = 0;
  File? postImage;
  var picker = ImagePicker();
  var textController = TextEditingController();

  bool isLoadingGettingUsers = false;
  bool isLoadingCreatePost = false;
  changeIsLoadingGettingUsers(bool state) {
    isLoadingGettingUsers = state;
    update();
  }
  changeIsLoadingCreatePost(bool state) {
    isLoadingCreatePost = state;
    update();
  }

/////////////////////////////////////
  // void getUsers() async {
  //   try {
  //     changeIsLoadingGettingUsers(true);
  //     print('/// GETTING USERS ...');
  //
  //     // todo: use filtration of firebase while getting the data
  //     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').get();
  //     users.addAll(snapshot.docs.map<AppUserModel>((e) => AppUserModel.fromJson(e.data())).toList());
  //     print(users.length);
  //
  //     users.removeWhere((AppUserModel element) => element.admin == true);
  //
  //     print(users);
  //     print(users.length);
  //     changeIsLoadingGettingUsers(false);
  //
  //   } catch (e, stacktrace) {
  //     changeIsLoadingGettingUsers(false);
  //     print(e);
  //     print(stacktrace);
  //   }
  //   update();
  // }

 getUsers() {
    if (users.isEmpty) {
     // print('/// GETTING USERS ..');
      FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .listen((event) {
       // print('/// NEW USER LISTENER TRIGGERED ..');
       // print('${event.docs}');
        users = [];
        event.docs.forEach((element) {
         // print(element.data()['admin']);
         // print ("هنا");
         // print(element.data()['uId']);

          if(element.data()['admin'] == false) users.add(AppUserModel.fromJson(element.data()));
          return element.data()['uId'];
        });

        userCount = users.length;
        update();

        //print(users.length);
      });
    }

    update();
  }

  /// todo: check method
  void getPosts() {
    if (posts.isEmpty) {
      FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
        posts = [];
        //postsId =[];
        event.docs.forEach((element) {
          //  posts =[];
          element.reference.collection('likes').snapshots().listen((event) {
            //   postsId =[];
            //  likes = [];
            likes.add(event.docs.length);
            postsId.add(element.id);
            posts.add(PostModel.fromJson(element.data()));
          });
          // posts =[];
        });
        update();
      });
    }
    update();
  }

  void getFeedbacks() {
    if (feedback.isEmpty) {
      FirebaseFirestore.instance.collection('feedback').snapshots().listen((event) {
        feedback = [];
        event.docs.forEach((element) {
          feedback.add(FeedbackModel.fromJson(element.data()));
        });
        update();
      });
    }
  }

  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    token = '';
    uId = '';
    isAdmin = null;
    Get.delete(tag: "homeController",force: true);
    navigateAndFinish(context, LoginScreen());
  }
  /////////////////////////
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  bool isLoadingGetUserData = false;
  changeIsLoadingGetUserDataState(bool state) {
    isLoadingGetUserData = state;
    update();
  }
  getUserData({String? uId}) {
    try {
      changeIsLoadingGetUserDataState(true);
      FirebaseFirestore.instance.collection('users').doc(uId).snapshots().listen((event) {
        userModel = AppUserModel.fromJson(event.data()! );
        nameController.text = userModel!.name!;
        emailController.text = userModel!.email!;
        ageController.text = userModel!.age!;
        changeIsLoadingGetUserDataState(false);

      });
      update();

      // return userModel;

    } catch (e, stacktrace) {
      if(kDebugMode) print('XXX EXCEPTION');
      if(kDebugMode) print(stacktrace);
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingGetUserDataState(false);
    }
  }
///////////////////////////////////////////////


  _uploadPostImage(profileImage) async {
    String path = 'post_pic-${DateTime.now()}';
    if(kDebugMode) print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('post_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    if(kDebugMode) print(imageUrl);
    return imageUrl;
    // updateUser(name: name, email: email, age: age, phone: phone, image: imageUrl);

    // firebase_storage.FirebaseStorage.instance
    //     .ref()
    //     .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
    //     .putFile(profileImage!)
    //     .then((value) {
    //   value.ref.getDownloadURL().then((value) {
    //     print(value);
    //     updateUser(name: name, email: email, age: age, phone: phone, image: value);
    //   }).catchError((error) {});
    // }).catchError((error) {});
    // update();
  }

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
    } else {
      if(kDebugMode) print('no image selected');
    }
    update();
  }

  removePostImage() {
    postImage = null;
    update();
  }

  void createPost({
    required String dateTime,
    required String text,
  }) async {
    changeIsLoadingCreatePost(true);
    String? imageUrl;

    // add image to firestore
    if (postImage != null) {
      imageUrl = await _uploadPostImage(postImage);
    }

    // use the image link
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: imageUrl ?? '',
      likesCount: 0,
    );

    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      textController.text = '';
      postImage = null;
      // FirebaseFirestore.instance.collection('posts').doc(value.id).collection('likes')

      changeIsLoadingCreatePost(false);
    }).catchError((error) {
      changeIsLoadingCreatePost(false);
    });

    FirebaseFirestore.instance.collection('posts').orderBy('dateTime');

    update();
  }












  /////////////////////////////

  @override
  void onInit() {
    getFeedbacks();
    getPosts();
    // getUsers();
    getUsers();
    getUserData(uId: uId);
    super.onInit();
  }
}

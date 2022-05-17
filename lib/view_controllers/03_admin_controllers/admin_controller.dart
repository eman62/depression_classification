import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/models/post_model.dart';
import '../../helpers/cache_helper.dart';
import '../../helpers/globals.dart';
import '../../models/feedback_model.dart';
import '../../models/user_model.dart';
import '../../views/01_auth/login_screen.dart';
import '../../views/widgets/components.dart';

class AdminController extends GetxController {
  List<FeedbackModel> feedback = [];
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<AppUserModel> users = [];
  AppUserModel? userModel;
  int userCount = 0;

  bool isLoadingGettingUsers = false;

  changeIsLoadingGettingUsers(bool state) {
    isLoadingGettingUsers = state;
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
      print('/// GETTING USERS ..');
      FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .listen((event) {
        print('/// NEW USER LISTENER TRIGGERED ..');
        print('${event.docs}');
        users = [];
        event.docs.forEach((element) {
         // print(element.data()['admin']);
          print ("هنا");
         // print(element.data()['uId']);

          if(element.data()['admin'] == false) users.add(AppUserModel.fromJson(element.data()));
          return element.data()['uId'];
        });

        userCount = users.length;
        update();

        print(users.length);
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
    navigateAndFinish(context, SocialLoginScreen());
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
        phoneController.text = userModel!.phone!;
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

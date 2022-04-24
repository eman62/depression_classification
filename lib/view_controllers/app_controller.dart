import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/layout/home_layout/admin_home_layout.dart';
import 'package:save/layout/home_layout/home_screen.dart';

import '../models/user_model.dart';
import '../shared/components/components.dart';
import '../shared/network/local/cache_helper.dart';
import '../views/auth/login_screen.dart';

class AppController extends GetxController {
  bool isDark = false;
// ThemeMode appMode =ThemeMode.dark;

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  bool isLoadingLogin = false;
  bool isLoadingGetUserData = false;
  bool isLoadingRegister = false;

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
      await CacheHelper.saveData(key: 'admin', value: user!.admin);
      await CacheHelper.saveData(key: 'uId', value: credential.user!.uid);

      print('/// NAME: ${user.name}');
      print('/// ADMIN: ${user.admin}');
      print('/// EMAIL: ${user.email}');

      // todo: re-activate
      // navigate(user.admin!);

      changeIsLoadingLoginState(false);
    } on Exception catch (e) {
      showToast(text: e.toString(), state: ToastStates.ERROR);
      changeIsLoadingLoginState(false);
    }
  }

  navigate(bool isAdmin) {
    isAdmin ? Get.offAll(const AdminHome()) : Get.offAll(HomeScreen());
  }

  getUserData({String? uId}) async {
    try {
      changeIsLoadingGetUserDataState(true);
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(uId).get();
      AppUserModel userModel = AppUserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
      changeIsLoadingGetUserDataState(false);
      return userModel;
    } on Exception catch (e) {
      showToast(text: e.toString(), state: ToastStates.ERROR);
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
      // CacheHelper.saveData(key: 'uId', value: value.user!.uid);
    }).catchError((e) {
      print(e.toString());
      showToast(text: e.toString(), state: ToastStates.ERROR);
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
      showToast(text: e.toString(), state: ToastStates.ERROR);
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

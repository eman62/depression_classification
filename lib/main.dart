import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/helpers/cache_helper.dart';
import 'package:save/models/user_model.dart';
import 'package:save/view_controllers/01_auth_controllers/auth_controller.dart';
import 'package:save/view_controllers/theme_controller.dart';
import 'package:save/views/01_auth/splash_screen.dart';
import 'helpers/globals.dart';
import 'style/themes.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  // await CacheHelper.reset();
  await Firebase.initializeApp();
  SplashRoute splashRoute;

  /// To clear the global variables upon hot restart
  uId = '';
  isAdmin = null;
  token = '';

  uId = await CacheHelper.getData(key: 'uId');
  isAdmin = await CacheHelper.getData(key: 'admin');
  // token = await CacheHelper.getData(key: 'token'); // todo: not yet implemented

  print('/// saved uId: $uId');
  print('/// saved isAdmin: $isAdmin');

  if (uId != null) {

    if (isAdmin!) {
      splashRoute = SplashRoute.admin;
    } else {
      bool? isLocked;
      DocumentSnapshot? snapshot = await FirebaseFirestore.instance.collection('users').doc(uId).get();
      AppUserModel? user = AppUserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
      isLocked = user.isLocked;
      print('/// NAME: ${user.name}');
      print('/// ADMIN: ${user.admin}');
      print('/// EMAIL: ${user.email}');
      print('/// IS_LOCKED: ${user.isLocked}');
      if(isLocked!) {
        splashRoute = SplashRoute.locked;
      } else {
        splashRoute = SplashRoute.user;
      }
    }
  } else {
    splashRoute = SplashRoute.onBoarding;
  }

  runApp(MyApp(splashRoute: splashRoute));

}

class MyApp extends StatelessWidget {
  // final bool isDark;
  final SplashRoute splashRoute;
  MyApp({Key? key, required this.splashRoute}) : super(key: key);

  final authController = Get.put(AuthController(), permanent: false);
  final themeController = Get.put(ThemeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Depression Classification',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeController.initialThemeMode!,
      home: SplashScreen(route: splashRoute),
    );
  }
}

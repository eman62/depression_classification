import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/helpers/cache_helper.dart';
import 'package:save/view_controllers/01_auth_controllers/auth_controller.dart';
import 'package:save/views/01_auth/login_screen.dart';
import 'package:save/views/02_user/home_screen.dart';
import 'package:save/views/03_admin/admin_home.dart';
import 'helpers/globals.dart';
import 'style/themes.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // await CacheHelper.reset();
  await Firebase.initializeApp();
  bool? isDark = await CacheHelper.getData(key: 'isDark');
  Widget widget;

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
      widget = AdminHome();
    } else {
      widget = HomeScreen();
    }
  } else {
    widget = SocialLoginScreen();
  }

  // widget = SocialLoginScreen();


  runApp(MyApp(isDark: isDark, startWidget: widget));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;
  MyApp({Key? key, this.isDark, this.startWidget}) : super(key: key);

  final appController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Depression Classification',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: Get.find<AuthController>().isDark ? ThemeMode.light : ThemeMode.dark,

      // home: startWidget,
      home: startWidget,
    );
  }
}

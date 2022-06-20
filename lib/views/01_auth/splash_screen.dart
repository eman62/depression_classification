import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/views/02_user/home_screen.dart';
import 'package:save/views/02_user/locked_screen.dart';
import 'package:save/views/02_user/on_boarding_screens/on_boarding_screens.dart';
import 'package:save/views/03_admin/admin_home.dart';

class SplashScreen extends StatefulWidget {

  final SplashRoute route;

  const SplashScreen({Key? key, required this.route}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startNavigationTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
    // return route();
  }

  route() async {
    if(widget.route == SplashRoute.admin) {
      Get.off(const AdminHome());
    }
    else if(widget.route == SplashRoute.user) {
      Get.off(const HomeScreen());

    }
    else if(widget.route == SplashRoute.locked) {
      Get.off(const LockedScreen());

    }
    else {
      Get.off(const OnBoardingScreen());

    }
  }

  @override
  void initState() {
    super.initState();
    startNavigationTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset('assets/images/logo.png', height: 150),
          ),
        ),
      ),
    );
  }
}

enum SplashRoute {
  admin,
  user,
  locked,
  onBoarding,
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/data/prefs.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/home.dart';
import 'package:nearexpiryshopdriver/ui/screens/login/login.dart';
import 'package:nearexpiryshopdriver/ui/widgets/bg_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (Preference.getLoggedInFlag()) {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.toNamed(HomeScreen.routeName),
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.toNamed(LoginScreen.routeName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            buildLogoBG(-100, 250),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 220.h,
                width: 220.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nearexpiryshopdriver/states/bindings/home.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/home.dart';
import 'package:nearexpiryshopdriver/ui/screens/job_details/job_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/login/login.dart';
import 'package:nearexpiryshopdriver/ui/screens/orders/orders.dart';
import 'package:nearexpiryshopdriver/ui/screens/otp/otp.dart';
import 'package:nearexpiryshopdriver/ui/screens/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/screens/trip/trip.dart';

Future<void> main() async {
  runApp(const MyApp());
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 923),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: SplashScreen.routeName,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: HomeScreen.routeName,
              page: () => const HomeScreen(),
              binding: HomeBinding(),
            ),
            GetPage(
              name: LoginScreen.routeName,
              page: () => const LoginScreen(),
            ),
            GetPage(
              name: OTPScreen.routeName,
              page: () => const OTPScreen(),
            ),
            GetPage(
              name: JobDetailsScreen.routeName,
              page: () => JobDetailsScreen(),
            ),
            GetPage(
              name: TripScreen.routeName,
              page: () => TripScreen(),
            ),
            GetPage(
              name: OrdersScreen.routeName,
              page: () => const OrdersScreen(),
            ),
          ],
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/controllers/login.dart';
import 'package:nearexpiryshopdriver/states/data/prefs.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/home.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_field.dart';
import 'package:nearexpiryshopdriver/ui/widgets/field_title.dart';
import 'package:nearexpiryshopdriver/ui/widgets/login_otp_bg.dart';
import 'package:nearexpiryshopdriver/ui/widgets/login_top_img.dart';

class OTPScreen extends StatefulWidget {
  static String routeName = '/otp';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final LoginController _loginCon = Get.find<LoginController>();
  final TextEditingController _otpCon = TextEditingController();
  bool _submittedFlag = false;
  String phoneNumber = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginTopImg('assets/images/driver2.png', backBtnFlag: true),
            LoginOtpBg(
              middleWidget: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 65),
                    child: fieldTitle(
                      'assets/images/ic-otp.png',
                      'Enter OTP',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 65),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    child: CustomTextField(
                      con: _otpCon,
                      hintTxt: 'ex:123456',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 65,
                      vertical: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _submittedFlag
                            ? Obx(() {
                                if (_loginCon.isLoading.value) {
                                  return const CircularProgressIndicator();
                                } else {
                                  if (_loginCon.driverDetails != null) {
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () async {
                                        Preference.setLoggedInFlag(true);
                                        Preference.setDriverID(
                                          _loginCon.driverDetails!.driverId,
                                        );
                                        Preference.setDriverName(
                                          _loginCon.driverDetails!.name,
                                        );
                                        Preference.setDriverAddress(
                                          _loginCon.driverDetails!.address,
                                        );
                                        Preference.setDriverImg(
                                          _loginCon.driverDetails!.image,
                                        );
                                        Get.toNamed(HomeScreen.routeName);
                                      },
                                    );
                                    return const Text(
                                      "Login Success!",
                                    );
                                  } else {
                                    return const Text(
                                      "Login Failed!",
                                    );
                                  }
                                }
                              })
                            : CustomBtn(
                                title: 'Enter OTP',
                                onTapFn: () => setState(() {
                                  _submittedFlag = true;
                                  print(phoneNumber.substring(3));
                                  _loginCon.loginFn(
                                    userName: phoneNumber.substring(3),
                                    password: '123456',
                                  );
                                }),
                                btnSize: const Size(108, 45),
                              ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

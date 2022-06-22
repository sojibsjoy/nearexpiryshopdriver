import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final TextEditingController _otpCon = TextEditingController();
  String phoneNumber = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginTopImg('assets/images/driver2.png'),
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
                        CustomBtn(
                          title: 'Enter OTP',
                          onTapFn: () => Get.toNamed(HomeScreen.routeName),
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

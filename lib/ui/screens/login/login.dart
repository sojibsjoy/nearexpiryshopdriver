import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/ui/screens/otp/otp.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_field.dart';
import 'package:nearexpiryshopdriver/ui/widgets/field_title.dart';
import 'package:nearexpiryshopdriver/ui/widgets/login_otp_bg.dart';
import 'package:nearexpiryshopdriver/ui/widgets/login_top_img.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneCon = TextEditingController();
  String _phoneCode = '+971';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginTopImg('assets/images/driver1.png'),
            LoginOtpBg(
              middleWidget: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 65),
                        child: fieldTitle(
                            'assets/images/ic_phone.png', 'Mobile Number'),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CountryCodePicker(
                              initialSelection: _phoneCode,
                              padding: EdgeInsets.zero,
                              showDropDownButton: true,
                              onChanged: (CountryCode code) {
                                setState(() {
                                  _phoneCode = code.dialCode ?? '+971';
                                });
                              },
                              favorite: const ['+966', '+973', '+971'],
                              textStyle: const TextStyle(
                                fontSize: 12.5,
                                color: Colors.black,
                              ),
                              showFlagDialog: true,
                              flagWidth: 15,
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: CustomTextField(
                                con: _phoneCon,
                                hintTxt: 'ex:123456789',
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 65,
                          vertical: 30,
                        ),
                        child: CustomBtn(
                          title: 'Sent OTP',
                          onTapFn: () => Get.toNamed(
                            OTPScreen.routeName,
                            arguments: _phoneCode + _phoneCon.text,
                          ),
                          btnSize: const Size(295, 45),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

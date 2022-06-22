import 'package:flutter/material.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOtpBg extends StatelessWidget {
  final Widget middleWidget;
  const LoginOtpBg({
    Key? key,
    required this.middleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: 515,
            padding: const EdgeInsets.only(top: 44),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 124.h,
                  width: 124.w,
                ),
                addH(50),
                middleWidget
              ],
            ),
          ),
          Image.asset(
            'assets/images/logo_shadow.png',
            height: 150,
          ),
        ],
      ),
    );
  }
}

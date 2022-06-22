import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavIcon extends StatelessWidget {
  String? icon;
  final String txt;
  VoidCallback? onTapFn;
  NavIcon({
    Key? key,
    this.icon,
    required this.txt,
    this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            SvgPicture.asset(
              icon!,
            ),
          addH(5),
          Text(
            txt,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Colors.red.shade900,
            ),
          ),
        ],
      ),
    );
  }
}

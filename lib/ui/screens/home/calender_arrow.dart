import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalenderArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTapFn;
  final bool noPadding;
  const CalenderArrow({
    Key? key,
    required this.icon,
    required this.onTapFn,
    required this.noPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 30.w,
        height: 30.h,
        padding:
            noPadding != false ? EdgeInsets.zero : EdgeInsets.only(left: 6.w),
        margin: EdgeInsets.only(
          right: noPadding ? 0 : 10.w,
          left: noPadding ? 10.w : 0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}

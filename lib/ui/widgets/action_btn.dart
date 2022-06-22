import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/location_mini.svg',
          height: 12.h,
        ),
        addW(5),
        Text(
          'Dubai',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12.sp,
          ),
        ),
        Icon(
          Icons.arrow_drop_down,
          color: Colors.grey.shade600,
        ),
        addW(5.w),
      ],
    );
  }
}

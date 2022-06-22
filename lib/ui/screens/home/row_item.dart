import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class RowItem extends StatelessWidget {
  final String prefixTxt;
  final String suffixTxt;
  double? suffixTxtSize;
  FontWeight? suffixTxtWeight;
  Color? suffixTxtClr;
  String? suffixIcon;

  RowItem({
    Key? key,
    required this.prefixTxt,
    required this.suffixTxt,
    this.suffixTxtSize,
    this.suffixTxtWeight,
    this.suffixTxtClr,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          prefixTxt,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        addW(2),
        Text(
          suffixTxt,
          style: TextStyle(
            fontSize: suffixTxtSize ?? 11.sp,
            color: suffixTxtClr ?? Colors.black,
            fontWeight: suffixTxtWeight ?? FontWeight.normal,
          ),
        ),
        const Spacer(),
        if (suffixIcon != null)
          SvgPicture.asset(
            suffixIcon!,
          ),
      ],
    );
  }
}

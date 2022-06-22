import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  Color? txtClr;
  double? txtSize;
  final VoidCallback onTapFn;
  final Size btnSize;
  Color? bgClr;
  Color? borderClr;
  CustomBtn({
    Key? key,
    required this.title,
    this.txtClr,
    this.txtSize,
    required this.onTapFn,
    required this.btnSize,
    this.bgClr,
    this.borderClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapFn,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          bgClr ?? Colors.black,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: borderClr != null
                ? BorderSide(
                    color: borderClr!,
                    width: 1.h,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          btnSize,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: txtClr,
          fontSize: txtSize,
        ),
      ),
    );
  }
}

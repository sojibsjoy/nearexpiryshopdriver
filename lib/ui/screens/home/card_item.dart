import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/dialog_view.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/order_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/screens/job_details/job_details.dart';

class CardItem extends StatelessWidget {
  final OrderDetailsModel oDetailsModel;
  const CardItem({
    Key? key,
    required this.oDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        JobDetailsScreen.routeName,
        arguments: oDetailsModel,
      ),
      // onTap: () => customDialog(context),
      child: SizedBox(
        height: 215.h,
        width: 390.w,
        child: Card(
          elevation: 1,
          child: OrderDetailsView(oDetailsModel: oDetailsModel),
        ),
      ),
    );
  }

  customDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: DialogView(oDetailsModel: oDetailsModel),
        );
      },
    );
  }
}

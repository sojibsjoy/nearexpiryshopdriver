import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/constants/colors.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/order_details_view.dart';
import 'package:nearexpiryshopdriver/ui/screens/trip/trip.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_btn.dart';

class NavBarDesign extends StatelessWidget {
  final OrderDetailsModel oDetailsModel;
  const NavBarDesign({
    Key? key,
    required this.oDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 50.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: OrderDetailsView(
              oDetailsModel: oDetailsModel,
            ),
          ),
          Container(
            height: 95.h,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // on the way btn
                CustomBtn(
                  title: 'On the way',
                  onTapFn: () => Get.toNamed(
                    TripScreen.routeName,
                    arguments: oDetailsModel,
                  ),
                  btnSize: Size(177.w, 52.h),
                ),
                // cancel btn
                CustomBtn(
                  title: 'Cancel',
                  onTapFn: () {},
                  btnSize: Size(177.w, 52.h),
                  txtClr: ConstantColors.kPrimaryClr,
                  bgClr: Colors.white,
                  borderClr: ConstantColors.kPrimaryClr,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

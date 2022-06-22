import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/job_details/nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_network_img.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_scaffold.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class JobDetailsScreen extends StatelessWidget {
  static String routeName = '/job_details';
  JobDetailsScreen({Key? key}) : super(key: key);

  final OrderDetailsModel oDetailsM = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Job Details',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/map.png',
            )
          ],
        ),
      ),
      btmNavBar: NavBarDesign(
        oDetailsModel: oDetailsM,
      ),
      floatingActionBtn: Container(
        height: 95.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: CustomNetworkImg(
                url: oDetailsM.customerViewModel.image,
              ),
            ),
            addW(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  oDetailsM.customerViewModel.firstLastName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                addH(5.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/location_mini.svg',
                      height: 16.h,
                    ),
                    Text(
                      oDetailsM
                          .customerViewModel.customerAddressViewModel.address,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

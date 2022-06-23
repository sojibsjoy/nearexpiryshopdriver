import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/constants/colors.dart';
import 'package:nearexpiryshopdriver/states/controllers/login.dart';
import 'package:nearexpiryshopdriver/states/data/prefs.dart';
import 'package:nearexpiryshopdriver/ui/screens/login/login.dart';
import 'package:nearexpiryshopdriver/ui/screens/orders/orders.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_network_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final LoginController _loginCon = Get.find<LoginController>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ConstantColors.kPrimaryClr,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, right: 20.w),
                    child: InkWell(
                      onTap: () => Scaffold.of(context).closeDrawer(),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            // driver image
                            child: CustomNetworkImg(
                              url: _loginCon.driverDetails!.image,
                            ),
                          ),
                          addW(10.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // driver name
                              Text(
                                _loginCon.driverDetails!.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                              addH(6.h),
                              // driver location
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/location_mini.svg',
                                    color: Colors.white,
                                  ),
                                  addW(5.w),
                                  Text(
                                    _loginCon.driverDetails!.address,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                padding: EdgeInsets.only(top: 30.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        buildIcon(
                          index: 0,
                          icon: 'assets/svg/home.svg',
                        ),
                        buildIcon(
                          index: 1,
                          icon: 'assets/svg/job.svg',
                        ),
                        buildIcon(
                          index: 2,
                          icon: 'assets/svg/order.svg',
                        ),
                        buildIcon(
                          index: 3,
                          icon: 'assets/svg/notification.svg',
                        ),
                        buildIcon(
                          index: 4,
                          icon: 'assets/svg/profile.svg',
                        ),
                        buildIcon(
                          index: 5,
                          icon: 'assets/svg/privacy.svg',
                        ),
                        buildIcon(
                          index: 6,
                          icon: 'assets/svg/logout.svg',
                        ),

                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 45.h,
                        //       width: 40.w,
                        //       margin: EdgeInsets.symmetric(
                        //         horizontal: 20.w,
                        //         vertical: 10.h,
                        //       ),
                        //       decoration: BoxDecoration(
                        //         color: ConstantColors.kPrimaryClr.withOpacity(0.1),
                        //         borderRadius: BorderRadius.circular(10.r),
                        //       ),
                        //       child: Center(
                        //         child: SvgPicture.asset(
                        //           'assets/svg/home.svg',
                        //           height: 15.h,
                        //           color: ConstantColors.kPrimaryClr,
                        //         ),
                        //       ),
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Home',
                        //           style: TextStyle(
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w600,
                        //             color: ConstantColors.kPrimaryClr,
                        //           ),
                        //         ),
                        //         Container(
                        //           height: 1,
                        //           width: 300.w,
                        //           margin: EdgeInsets.only(top: 15.h),
                        //           color: Colors.grey.shade300,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 40.w,
                        bottom: 195.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTitle(
                            index: 0,
                            title: 'Home',
                            onTapFn: () {},
                          ),
                          buildTitle(
                            index: 1,
                            title: 'Job List',
                            onTapFn: () {},
                          ),
                          buildTitle(
                            index: 2,
                            title: 'My Order',
                            onTapFn: () => Get.toNamed(OrdersScreen.routeName),
                          ),
                          buildTitle(
                            index: 3,
                            title: 'Notifications',
                            onTapFn: () {},
                          ),
                          buildTitle(
                            index: 4,
                            title: 'My Profile',
                            onTapFn: () {},
                          ),
                          buildTitle(
                            index: 5,
                            title: 'Privacy Policy',
                            onTapFn: () {},
                          ),
                          buildTitle(
                            index: 6,
                            title: 'Logout',
                            onTapFn: () {
                              Preference.clearAll();
                              Get.offAllNamed(LoginScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIcon({
    required int index,
    required String icon,
  }) {
    return InkWell(
      onTap: () => setState(() {
        selectedIndex = index;
      }),
      child: Container(
        height: 45.h,
        width: 40.w,
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: index == selectedIndex
              ? ConstantColors.kPrimaryClr.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 15.h,
            color: index == selectedIndex
                ? ConstantColors.kPrimaryClr
                : Colors.grey.shade800,
          ),
        ),
      ),
    );
  }

  Widget buildTitle({
    required int index,
    required String title,
    required VoidCallback onTapFn,
  }) {
    return InkWell(
      onTap: onTapFn,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: index == selectedIndex
                  ? ConstantColors.kPrimaryClr
                  : Colors.grey.shade800,
            ),
          ),
          Container(
            height: 1,
            width: 300.w,
            margin: EdgeInsets.only(top: 15.h),
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

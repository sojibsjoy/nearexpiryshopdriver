import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/constants/colors.dart';
import 'package:nearexpiryshopdriver/constants/strings.dart';
import 'package:nearexpiryshopdriver/states/controllers/home.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/home.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/order_details_view.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/row_item.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_network_img.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class TripScreen extends StatefulWidget {
  static String routeName = '/trip';
  const TripScreen({Key? key}) : super(key: key);

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final OrderDetailsModel oDetailsM = Get.arguments;
  final HomeController _homeCon = Get.find<HomeController>();

  bool _deliveredFlag = false;

  @override
  Widget build(BuildContext context) {
    print(oDetailsM.productName);
    return CustomScaffold(
      title: 'Trip',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addH(30.h),
            Center(
              child: Text(
                'Product:${oDetailsM.productName}\nDelivered to The Customer',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            addH(20.h),
            Card(
              elevation: 0.15,
              shadowColor: Colors.grey.shade600,
              child: OrderDetailsView(oDetailsModel: oDetailsM),
            ),
            // Payment Information
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Text(
                'Payment Information',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  children: [
                    Container(
                      height: 63.h,
                      width: 63.w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      // product image
                      child: CustomNetworkImg(
                        url: oDetailsM.productImage,
                      ),
                    ),
                    addW(10.w),
                    SizedBox(
                      width: 260.w,
                      child: Column(
                        children: [
                          RowItem(
                            prefixTxt: 'Status:',
                            suffixTxt: oDetailsM.statusName,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          RowItem(
                            prefixTxt: 'Type:',
                            suffixTxt: oDetailsM.statusName,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          RowItem(
                            prefixTxt: 'Amount:',
                            suffixTxt: 'AED ${oDetailsM.totalAmount.round()}',
                            suffixTxtSize: 14.sp,
                            suffixTxtWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      btmNavBar: Container(
        width: double.infinity,
        height: 180.h,
        color: Colors.white,
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _deliveredFlag
                    ? SizedBox(
                        width: 177.w,
                        height: 52.h,
                        child: Obx(
                          () {
                            if (_homeCon.updatingOrderStatusFlag.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => Get.toNamed(HomeScreen.routeName),
                              );
                              return const Center(
                                child: Text(
                                  'Delivered Successfull!',
                                ),
                              );
                            }
                          },
                        ),
                      )
                    : CustomBtn(
                        title: 'Delivered',
                        onTapFn: () => setState(() {
                          _deliveredFlag = true;
                          _homeCon.updateOrderStatus(
                            invoiceId: oDetailsM.invoiceId,
                            invoiceStatusId: ConstantStrings.kDelivered,
                          );
                        }),
                        btnSize: Size(177.w, 52.h),
                      ),
                CustomBtn(
                  title: 'Complaint',
                  onTapFn: () {},
                  btnSize: Size(177.w, 52.h),
                  txtClr: ConstantColors.kPrimaryClr,
                  bgClr: Colors.white,
                  borderClr: ConstantColors.kPrimaryClr,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBtn(
                  title: 'Call customer',
                  onTapFn: () {},
                  btnSize: Size(177.w, 52.h),
                  bgClr: ConstantColors.kPrimaryClr,
                ),
                CustomBtn(
                  title: 'Call help center',
                  onTapFn: () {},
                  btnSize: Size(177.w, 52.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

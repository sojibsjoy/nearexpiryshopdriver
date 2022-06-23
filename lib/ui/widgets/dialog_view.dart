import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/constants/colors.dart';
import 'package:nearexpiryshopdriver/constants/strings.dart';
import 'package:nearexpiryshopdriver/states/controllers/home.dart';
import 'package:nearexpiryshopdriver/states/models/cancel_reasons/cancel_reasons.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/order_details_view.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_field.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class DialogView extends StatefulWidget {
  final OrderDetailsModel oDetailsModel;
  const DialogView({
    Key? key,
    required this.oDetailsModel,
  }) : super(key: key);

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  final HomeController _homeCon = Get.find<HomeController>();
  final TextEditingController _declineDetailsCon = TextEditingController();
  bool _declineFlag = false;
  bool _submittedFlag = false;
  String declineReason = 'Long Distance';
  int cancelReasonId = 0;
  String updatedOrderStatus = '';

  @override
  void initState() {
    _homeCon.getCancelReasons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: 388.w,
      child: _submittedFlag ? showStatusUpdating() : showInitialView(),
    );
  }

  Widget showStatusUpdating() {
    return Obx(() {
      if (_homeCon.updatingOrderStatusFlag.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        Future.delayed(
          const Duration(seconds: 1),
          () => Get.back(),
        );
        return Center(
          child: Text(
            updatedOrderStatus,
          ),
        );
      }
    });
  }

  // () => setState(() {
  //             _submittedFlag = true;
  //             _homeCon.updateOrderStatus(
  //               invoiceId: widget.oDetailsModel.invoiceId,
  //               // here 14 means Accept.
  //               invoiceStatusId: 14,
  //             );
  //           }),

  Widget showInitialView() {
    return _declineFlag
        ? buildDialog(
            title: 'Pick A Reason For Cancellation',
            leftBtnTxt: 'Submit',
            leftBtnFn: () => setState(() {
              _submittedFlag = true;
              _homeCon.updateOrderStatus(
                invoiceId: widget.oDetailsModel.invoiceId,
                invoiceStatusId: ConstantStrings.kCancelled,
                cancelReasonId: cancelReasonId,
                cancelDescription: _declineDetailsCon.text,
              );
              updatedOrderStatus = 'Order Cancelled!';
            }),
            rightBtnTxt: 'Cancel',
            middlePart: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 11.h,
              ),
              child: Column(
                children: [
                  buildTitle(
                    icon: 'assets/svg/cancel.svg',
                    title: 'Select the Reason',
                  ),
                  // dropdown menu
                  Obx(() {
                    if (_homeCon.cancelReasonsLoadingFlag.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        height: 50.h,
                        child: DropdownButton(
                          value: declineReason,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.sp,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconSize: 20,
                          isExpanded: true,
                          items: _homeCon.cancelReasonList!
                              .map((CancelReasonsModel items) {
                            // getting the id of the cancel reason
                            cancelReasonId = items.invoiceCancelReasonId;
                            return DropdownMenuItem(
                              value: items.reasonName,
                              child: Text(items.reasonName),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() => declineReason = newValue!);
                          },
                        ),
                      );
                    }
                  }),
                  buildTitle(
                    icon: 'assets/svg/details.svg',
                    title: 'Detail Description',
                  ),
                  SizedBox(
                    height: 40.h,
                    child: CustomTextField(
                      con: _declineDetailsCon,
                      hintTxt: 'Type Here',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          )
        : buildDialog(
            title: 'New Order Request',
            leftBtnTxt: 'Accept',
            leftBtnFn: () => setState(() {
              _submittedFlag = true;
              _homeCon.updateOrderStatus(
                invoiceId: widget.oDetailsModel.invoiceId,
                invoiceStatusId: ConstantStrings.kAccepted,
              );
              updatedOrderStatus = 'Order Accepted!';
            }),
            rightBtnTxt: 'Decline',
            rightBtnFn: () => setState(() => _declineFlag = true),
            middlePart: OrderDetailsView(
              oDetailsModel: widget.oDetailsModel,
            ),
          );
  }

  Widget buildDialog({
    required String title,
    required String leftBtnTxt,
    required VoidCallback leftBtnFn,
    required String rightBtnTxt,
    VoidCallback? rightBtnFn,
    required Widget middlePart,
  }) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: ConstantColors.kPrimaryClr,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        middlePart,
        addH(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBtn(
              title: leftBtnTxt,
              txtSize: 12.sp,
              onTapFn: leftBtnFn,
              btnSize: Size(175.w, 36.h),
            ),
            CustomBtn(
              title: rightBtnTxt,
              txtSize: 12.sp,
              txtClr: ConstantColors.kPrimaryClr,
              onTapFn: rightBtnFn ?? () => Get.back(),
              btnSize: Size(175.w, 36.h),
              bgClr: Colors.white,
              borderClr: ConstantColors.kPrimaryClr,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTitle({
    required String icon,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 15.h,
          ),
          addW(10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

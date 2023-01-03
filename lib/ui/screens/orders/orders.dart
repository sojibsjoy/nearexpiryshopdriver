import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/controllers/home.dart';
import 'package:nearexpiryshopdriver/states/data/prefs.dart';
import 'package:nearexpiryshopdriver/states/helpers/date_formatter.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/card_item.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class OrdersScreen extends StatefulWidget {
  static String routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final HomeController _homeCon = Get.find<HomeController>();
  int driverId = 1; // 1 for default
  DateTime orderDate = DateTime.now();

  @override
  void initState() {
    driverId = Preference.getDriverID();
    Future.delayed(
      const Duration(seconds: 1),
      () => _homeCon.getCurrentOrders(
        driverId: driverId,
        date: DateFormatter.getFormatedDateForAPI(orderDate),
      ),
    );
    super.initState();
  }

  int selectedBtnId = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Orders',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addH(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBtn(
                  title: 'Current order',
                  onTapFn: () {
                    setState(() => selectedBtnId = 0);
                    _homeCon.getCurrentOrders(
                      driverId: driverId,
                      date: DateFormatter.getFormatedDateForAPI(orderDate),
                    );
                  },
                  btnSize: Size(125.w, 32.h),
                  txtSize: 14.sp,
                  bgClr: selectedBtnId == 0 ? Colors.white : null,
                  txtClr: selectedBtnId == 0 ? Colors.black : null,
                  borderClr: selectedBtnId == 0 ? Colors.black : null,
                ),
                CustomBtn(
                  title: 'Previous order',
                  onTapFn: () {
                    setState(() => selectedBtnId = 1);
                    _homeCon.getPreviousOrders(driverId: driverId);
                  },
                  btnSize: Size(125.w, 32.h),
                  txtSize: 14.sp,
                  bgClr: selectedBtnId == 1 ? Colors.white : null,
                  txtClr: selectedBtnId == 1 ? Colors.black : null,
                  borderClr: selectedBtnId == 1 ? Colors.black : null,
                ),
                CustomBtn(
                  title: 'Cancel order',
                  onTapFn: () {
                    setState(() => selectedBtnId = 2);
                  },
                  btnSize: Size(125.w, 32.h),
                  txtSize: 14.sp,
                  bgClr: selectedBtnId == 2 ? Colors.white : null,
                  txtClr: selectedBtnId == 2 ? Colors.black : null,
                  borderClr: selectedBtnId == 2 ? Colors.black : null,
                ),
              ],
            ),
            addH(10.h),
            getBodyView(),
          ],
        ),
      ),
    );
  }

  Widget getBodyView() {
    if (selectedBtnId == 0) {
      return buildBodyView(
        list: _homeCon.currentOrderList,
        onRefreshFn: () async => _homeCon.getCurrentOrders(
          driverId: driverId,
          date: DateFormatter.getFormatedDateForAPI(
            orderDate,
          ),
        ),
      );
    } else if (selectedBtnId == 1) {
      return buildBodyView(
        list: _homeCon.previousOrderList,
        onRefreshFn: () async => _homeCon.getPreviousOrders(
          driverId: driverId,
        ),
      );
    } else {
      return buildBodyView(
        list: _homeCon.currentOrderList,
        onRefreshFn: () async => _homeCon.getCurrentOrders(
          driverId: driverId,
          date: DateFormatter.getFormatedDateForAPI(
            orderDate,
          ),
        ),
      );
    }
  }

  Widget buildBodyView({
    required List<OrderDetailsModel>? list,
    required Future<void> Function() onRefreshFn,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Center(
        child: Obx(
          () {
            if (_homeCon.isLoading.value) {
              return Padding(
                padding: EdgeInsets.only(top: 280.h),
                child: const CircularProgressIndicator(),
              );
            } else {
              if (list == null || list.isEmpty) {
                return Padding(
                  padding: EdgeInsets.only(top: 280.h),
                  child: const Text("No Data Found!"),
                );
              } else {
                return SizedBox(
                  height: 728.h,
                  child: RefreshIndicator(
                    onRefresh: onRefreshFn,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: ((context, index) {
                        return CardItem(
                          oDetailsModel: list[index],
                        );
                      }),
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

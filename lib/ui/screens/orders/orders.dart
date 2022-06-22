import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/controllers/home.dart';
import 'package:nearexpiryshopdriver/states/helpers/date_formatter.dart';
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
  DateTime orderDate = DateTime.now();

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
            Padding(
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
                      if (_homeCon.currentOrderList == null ||
                          _homeCon.currentOrderList!.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: 280.h),
                          child: InkWell(
                            onTap: () async => _homeCon.getCurrentOrders(
                              driverId: 1,
                              date: '2022-06-16',
                              // date: DateFormatter.getFormatedDateForAPI(
                              //   orderDate,
                              // ),
                            ),
                            child: const Text("No Data Found!"),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 728.h,
                          child: RefreshIndicator(
                            onRefresh: () async => _homeCon.getCurrentOrders(
                              driverId: 1,
                              date: DateFormatter.getFormatedDateForAPI(
                                orderDate,
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: _homeCon.currentOrderList!.length,
                              itemBuilder: ((context, index) {
                                return CardItem(
                                  oDetailsModel:
                                      _homeCon.currentOrderList![index],
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
            ),
          ],
        ),
      ),
    );
  }
}

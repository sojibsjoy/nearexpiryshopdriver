import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/controllers/home.dart';
import 'package:nearexpiryshopdriver/states/data/prefs.dart';
import 'package:nearexpiryshopdriver/states/helpers/date_formatter.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/calender_arrow.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/card_item.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/drawer.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/nav_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/action_btn.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeCon = Get.find<HomeController>();
  DateTime orderDate = DateTime.now();
  int driverId = 1; // 1 for default

  @override
  void initState() {
    driverId = Preference.getDriverID();
    _homeCon.getCurrentOrders(
      driverId: driverId,
      date: DateFormatter.getFormatedDateForAPI(orderDate),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: InkWell(
          onTap: () => _homeCon.getCurrentOrders(
            driverId: driverId,
            date: DateFormatter.getFormatedDateForAPI(orderDate),
          ),
          child: Image.asset(
            'assets/images/logo_appbar.png',
          ),
        ),
        leading: Builder(
          builder: (context) => InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                height: 16.h,
              ),
            ),
          ),
        ),
        actions: const [
          ActionBtn(),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addH(10.h),
            Text(
              'List of Jobs',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            addH(30),
            // calender
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250.h,
                    child: Row(
                      children: [
                        CalenderArrow(
                          noPadding: false,
                          icon: Icons.arrow_back_ios,
                          onTapFn: () => setState(() {
                            orderDate = orderDate.subtract(
                              const Duration(days: 1),
                            );
                            _homeCon.getCurrentOrders(
                              driverId: driverId,
                              date: DateFormatter.getFormatedDateForAPI(
                                  orderDate),
                            );
                          }),
                        ),
                        InkWell(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5),
                              maxTime: DateTime(2022, 12, 31),
                              onConfirm: (date) => setState(() {
                                orderDate = date;
                                _homeCon.getCurrentOrders(
                                  driverId: driverId,
                                  date: DateFormatter.getFormatedDateForAPI(
                                    orderDate,
                                  ),
                                );
                              }),
                              currentTime: orderDate,
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/calender.svg',
                                height: 15.h,
                              ),
                              addW(5.w),
                              // show Date
                              Text(
                                DateFormatter.getFormatedDate(orderDate),
                              ),
                            ],
                          ),
                        ),
                        CalenderArrow(
                          noPadding: true,
                          icon: Icons.arrow_forward_ios,
                          onTapFn: () => setState(() {
                            orderDate = orderDate.add(
                              const Duration(days: 1),
                            );
                            _homeCon.getCurrentOrders(
                              driverId: driverId,
                              date: DateFormatter.getFormatedDateForAPI(
                                  orderDate),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/location.svg',
                        height: 18.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(15.h),
            // list of jobs
            Obx(
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
                      child: const Text("No Data Found!"),
                    );
                  } else {
                    return SizedBox(
                      height: 595.h,
                      child: RefreshIndicator(
                        onRefresh: () async => _homeCon.getCurrentOrders(
                          driverId: driverId,
                          date: DateFormatter.getFormatedDateForAPI(orderDate),
                        ),
                        child: ListView.builder(
                          itemCount: _homeCon.currentOrderList!.length,
                          itemBuilder: ((context, index) {
                            return CardItem(
                              oDetailsModel: _homeCon.currentOrderList![index],
                            );
                          }),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: 388.w,
          height: 65.h,
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          margin: EdgeInsets.only(left: 10.w, right: 10.h, bottom: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(
              color: Colors.red.shade900,
              width: 3,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavIcon(
                icon: 'assets/svg/home.svg',
                txt: 'Home',
                onTapFn: () {},
              ),
              NavIcon(txt: 'Orders'),
              NavIcon(
                icon: 'assets/svg/profile.svg',
                txt: 'Profile',
                onTapFn: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 58.h,
        width: 58.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.red.shade900,
            width: 3,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/order.svg',
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

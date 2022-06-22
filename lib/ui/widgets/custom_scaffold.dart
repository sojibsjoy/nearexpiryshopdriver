import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/ui/widgets/action_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  Widget? btmNavBar;
  Widget? floatingActionBtn;
  CustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.btmNavBar,
    this.floatingActionBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 80.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [
          ActionBtn(),
        ],
      ),
      body: body,
      bottomNavigationBar: btmNavBar,
      floatingActionButton: floatingActionBtn,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

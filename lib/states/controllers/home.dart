import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/models/cancel_reasons/cancel_reasons.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/states/services/home.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool updatingOrderStatusFlag = true.obs;
  RxBool cancelReasonsLoadingFlag = true.obs;

  List<OrderDetailsModel>? currentOrderList;
  List<CancelReasonsModel>? cancelReasonList;

  void getCurrentOrders({
    required int driverId,
    required String date,
  }) async {
    isLoading(true);
    try {
      currentOrderList = await HomeService.getCurrentOrders(
        driverID: driverId,
        date: date,
      );
    } finally {
      isLoading(false);
    }
  }

  void updateOrderStatus({
    required int invoiceId,
    required int invoiceStatusId,
    int? cancelReasonId,
    String? cancelDescription,
  }) async {
    updatingOrderStatusFlag(true);
    try {
      var response = await HomeService.updatingOrderStatus(
        invoiceId: invoiceId,
        invoiceStatusId: invoiceStatusId,
        cancelReasonId: cancelReasonId,
        cancelDescription: cancelDescription,
      );
      print(response);
    } finally {
      updatingOrderStatusFlag(false);
      // faching newly updated order list after order update
      // getCurrentOrders();
    }
  }

  void getCancelReasons() async {
    cancelReasonsLoadingFlag(true);
    try {
      cancelReasonList = await HomeService.getCancelReasons();
    } finally {
      cancelReasonsLoadingFlag(false);
    }
  }
}

import 'package:nearexpiryshopdriver/constants/strings.dart';
import 'package:nearexpiryshopdriver/states/models/cancel_reasons/cancel_reasons.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/states/services/base_client.dart';

class HomeService {
  static Future<List<OrderDetailsModel>> getCurrentOrders({
    required int driverID,
    required String date,
  }) async {
    List<OrderDetailsModel> orderDetailsList = List.empty(growable: true);
    var response = await BaseClient.getData(
      api:
          '${ConstantStrings.kDriverCurrnetOrder}driverId=$driverID&date=$date',
    );
    if (response is List) {
      for (var element in response) {
        orderDetailsList.add(OrderDetailsModel.fromJson(element));
      }
    }
    return orderDetailsList;
  }

  static Future<List<OrderDetailsModel>> getPreviousOrders({
    required int driverID,
  }) async {
    List<OrderDetailsModel> orderDetailsList = List.empty(growable: true);
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kDriverPreviousOrder}driverId=$driverID',
    );
    if (response is List) {
      for (var element in response) {
        orderDetailsList.add(OrderDetailsModel.fromJson(element));
      }
    }
    return orderDetailsList;
  }

  static Future<dynamic> updatingOrderStatus({
    required int invoiceId,
    required int invoiceStatusId,
    int? cancelReasonId,
    String? cancelDescription,
  }) async {
    var response;
    if (cancelReasonId == null) {
      // for accepting the order
      response = await BaseClient.getData(
        api:
            '${ConstantStrings.kUpdateOrderStatus}invoiceId=$invoiceId&invoiceStatusId=$invoiceStatusId',
      );

      print("accepted");
    } else {
      cancelDescription ??= '';
      // for cancelling the order
      String customAPI =
          '${ConstantStrings.kUpdateOrderStatus}invoiceId=$invoiceId&invoiceStatusId=$invoiceStatusId&cancelReasonId=$cancelReasonId&CancelDescription=$cancelDescription';
      print(customAPI);
      response = await BaseClient.getData(
        api: customAPI,
      );
      print("cancelled");
    }
    return response;
  }

  static Future<List<CancelReasonsModel>> getCancelReasons() async {
    List<CancelReasonsModel> list = List.empty(growable: true);
    var response = await BaseClient.getData(
      api: ConstantStrings.kCancelReasons,
    );
    if (response is List) {
      for (var element in response) {
        list.add(CancelReasonsModel.fromJson(element));
      }
    }
    return list;
  }
}

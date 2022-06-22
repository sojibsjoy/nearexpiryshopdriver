import 'dart:convert';

import 'package:nearexpiryshopdriver/states/models/order_details/customer_view.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    required this.invoiceId,
    required this.driverId,
    required this.refNumber,
    required this.productName,
    required this.productImage,
    required this.driverShipmentId,
    required this.totalAmount,
    required this.invoiceDate,
    required this.deliveryDate,
    required this.invoiceStatusId,
    required this.paymentStatus,
    required this.statusName,
    required this.customerId,
    required this.customerViewModel,
  });

  int invoiceId;
  int driverId;
  String refNumber;
  String productName;
  String productImage;
  int driverShipmentId;
  double totalAmount;
  String invoiceDate;
  String deliveryDate;
  int? invoiceStatusId;
  int paymentStatus;
  String statusName;
  int customerId;
  CustomerViewModel customerViewModel;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        invoiceId: json["invoiceId"],
        driverId: json["driverId"],
        refNumber: json["refNumber"],
        productName: json["productName"] ?? '',
        productImage: json["productImage"],
        driverShipmentId: json["driverShipmentId"],
        totalAmount: json["totalAmount"],
        invoiceDate: json["invoiceDate"],
        deliveryDate: json["deliveryDate"],
        invoiceStatusId: json["invoiceStatusId"],
        paymentStatus: json["paymentStatus"] ?? 1,
        statusName: json["statusName"],
        customerId: json["customerId"],
        customerViewModel:
            CustomerViewModel.fromJson(json["customerViewModel"]),
      );

  Map<String, dynamic> toJson() => {
        "invoiceId": invoiceId,
        "driverId": driverId,
        "refNumber": refNumber,
        "productName": productName,
        "productImage": productImage,
        "driverShipmentId": driverShipmentId,
        "totalAmount": totalAmount,
        "invoiceDate": invoiceDate,
        "deliveryDate": deliveryDate,
        "invoiceStatusId": invoiceStatusId,
        "paymentStatus": paymentStatus,
        "statusName": statusName,
        "customerId": customerId,
        "customerViewModel": customerViewModel.toJson(),
      };
}

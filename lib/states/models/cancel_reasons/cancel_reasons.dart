import 'dart:convert';

List<CancelReasonsModel> cancelReasonsModelFromJson(String str) =>
    List<CancelReasonsModel>.from(
        json.decode(str).map((x) => CancelReasonsModel.fromJson(x)));

String cancelReasonsModelToJson(List<CancelReasonsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CancelReasonsModel {
  CancelReasonsModel({
    // required this.invoiceCancelStatusId,
    // required this.invoiceId,
    required this.invoiceCancelReasonId,
    required this.reasonName,
    // required this.updateAt,
    // required this.cancelDescription,
  });

  // int invoiceCancelStatusId;
  // int invoiceId;
  int invoiceCancelReasonId;
  String reasonName;
  // dynamic updateAt;
  // dynamic cancelDescription;

  factory CancelReasonsModel.fromJson(Map<String, dynamic> json) =>
      CancelReasonsModel(
        // invoiceCancelStatusId: json["invoiceCancelStatusId"],
        // invoiceId: json["invoiceId"],
        invoiceCancelReasonId: json["invoiceCancelReasonId"],
        reasonName: json["reasonName"],
        // updateAt: json["updateAt"],
        // cancelDescription: json["cancelDescription"],
      );

  Map<String, dynamic> toJson() => {
        // "invoiceCancelStatusId": invoiceCancelStatusId,
        // "invoiceId": invoiceId,
        "invoiceCancelReasonId": invoiceCancelReasonId,
        "reasonName": reasonName,
        // "updateAt": updateAt,
        // "cancelDescription": cancelDescription,
      };
}

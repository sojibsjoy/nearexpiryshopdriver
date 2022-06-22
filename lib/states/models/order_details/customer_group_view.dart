class CustomerGroupViewModel {
  CustomerGroupViewModel({
    required this.customerGroupId,
    required this.groupName,
    required this.taxClass,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  int customerGroupId;
  String groupName;
  String? taxClass;
  String? isDeleted;
  DateTime createdAt;
  String? updatedAt;

  factory CustomerGroupViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerGroupViewModel(
        customerGroupId: json["customerGroupId"],
        groupName: json["groupName"],
        taxClass: json["taxClass"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "customerGroupId": customerGroupId,
        "groupName": groupName,
        "taxClass": taxClass,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt,
      };
}

import 'dart:convert';

DriverDetailsModel driverDetailsModelFromJson(String str) =>
    DriverDetailsModel.fromJson(json.decode(str));

String driverDetailsModelToJson(DriverDetailsModel data) =>
    json.encode(data.toJson());

class DriverDetailsModel {
  DriverDetailsModel({
    required this.driverId,
    required this.supplierId,
    required this.name,
    required this.phoneNo,
    required this.phoneNo1,
    required this.phoneNo3,
    required this.email,
    required this.address,
    required this.licenceNo,
    required this.licenceExpireDate,
    required this.licenceCountryId,
    required this.vehicleNo,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.username,
    required this.image,
    required this.commission,
  });

  int driverId;
  int supplierId;
  String name;
  String phoneNo;
  String phoneNo1;
  String phoneNo3;
  String email;
  String address;
  String licenceNo;
  String licenceExpireDate;
  int licenceCountryId;
  String vehicleNo;
  int countryId;
  int stateId;
  int cityId;
  String username;
  String image;
  int commission;

  factory DriverDetailsModel.fromJson(Map<String, dynamic> json) =>
      DriverDetailsModel(
        driverId: json["driverId"],
        supplierId: json["supplierId"],
        name: json["name"],
        phoneNo: json["phoneNo"],
        phoneNo1: json["phoneNo1"],
        phoneNo3: json["phoneNo3"],
        email: json["email"],
        address: json["address"],
        licenceNo: json["licenceNo"],
        licenceExpireDate: json["licenceExpireDate"],
        licenceCountryId: json["licenceCountryId"],
        vehicleNo: json["vehicleNo"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        username: json["username"],
        image: json["image"] ?? '',
        commission: json["commission"],
      );

  Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "supplierId": supplierId,
        "name": name,
        "phoneNo": phoneNo,
        "phoneNo1": phoneNo1,
        "phoneNo3": phoneNo3,
        "email": email,
        "address": address,
        "licenceNo": licenceNo,
        "licenceExpireDate": licenceExpireDate,
        "licenceCountryId": licenceCountryId,
        "vehicleNo": vehicleNo,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "username": username,
        "image": image,
        "commission": commission,
      };
}

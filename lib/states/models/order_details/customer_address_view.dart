class CustomerAddressViewModel {
  CustomerAddressViewModel({
    required this.customerAddressId,
    required this.customerId,
    // required this.addressType,
    // required this.countryId,
    // required this.stateId,
    // required this.cityId,
    required this.address,
    // required this.buildingName,
    // required this.flatNo,
    // required this.latitude,
    // required this.longitude,
    // required this.nearByLocation,
    required this.isDefault,
    required this.status,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.countryName,
    // required this.stateName,
    // required this.cityName,
    // required this.addressLine2,
    // required this.zipCode,
    // required this.phoneNumber,
    // required this.customerViewModel,
  });

  int customerAddressId;
  int customerId;
  // String addressType;
  // int countryId;
  // int stateId;
  // int cityId;
  String address;
  // String? buildingName;
  // String? flatNo;
  // String? latitude;
  // String? longitude;
  // String? nearByLocation;
  bool isDefault;
  String status;
  // String createdAt;
  // String updatedAt;
  // String? countryName;
  // String? stateName;
  // String? cityName;
  // String? addressLine2;
  // String? zipCode;
  // String? phoneNumber;
  // String? customerViewModel;

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddressViewModel(
        customerAddressId: json["customerAddressId"],
        customerId: json["customerId"],
        // addressType: json["addressType"],
        // countryId: json["countryId"],
        // stateId: json["stateId"],
        // cityId: json["cityId"],
        address: json["address"] ?? '',
        // buildingName: json["buildingName"],
        // flatNo: json["flatNo"],
        // latitude: json["latitude"],
        // longitude: json["longitude"],
        // nearByLocation: json["nearByLocation"],
        isDefault: json["isDefault"] ?? false,
        status: json["status"] ?? '',
        // createdAt: json["createdAt"],
        // updatedAt: json["updatedAt"],
        // countryName: json["countryName"],
        // stateName: json["stateName"],
        // cityName: json["cityName"],
        // addressLine2: json["addressLine2"],
        // zipCode: json["zipCode"],
        // phoneNumber: json["phoneNumber"],
        // customerViewModel: json["customerViewModel"],
      );

  Map<String, dynamic> toJson() => {
        "customerAddressId": customerAddressId,
        "customerId": customerId,
        // "addressType": addressType,
        // "countryId": countryId,
        // "stateId": stateId,
        // "cityId": cityId,
        "address": address,
        // "buildingName": buildingName,
        // "flatNo": flatNo,
        // "latitude": latitude,
        // "longitude": longitude,
        // "nearByLocation": nearByLocation,
        "isDefault": isDefault,
        "status": status,
        // "createdAt": createdAt,
        // "updatedAt": updatedAt,
        // "countryName": countryName,
        // "stateName": stateName,
        // "cityName": cityName,
        // "addressLine2": addressLine2,
        // "zipCode": zipCode,
        // "phoneNumber": phoneNumber,
        // "customerViewModel": customerViewModel,
      };
}

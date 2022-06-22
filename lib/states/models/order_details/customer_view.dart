import 'package:nearexpiryshopdriver/states/models/order_details/customer_address_view.dart';

class CustomerViewModel {
  CustomerViewModel({
    required this.customerId,
    required this.userName,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    // required this.email2,
    required this.phoneNo,
    // required this.phoneNo2,
    // required this.phoneNo3,
    required this.gender,
    // required this.dateOfBirth,
    required this.points,
    // required this.pointInValue,
    // required this.ratings,
    // required this.totalOrders,
    // required this.isBlacklisted,
    // required this.isCorporate,
    // required this.isNewsletterSub,
    // required this.isReviewEnable,
    // required this.isUpdatePassword,
    // required this.isUpdateAddress,
    // required this.age,
    // required this.kids,
    // required this.pet,
    required this.password,
    // required this.accountType,
    // required this.customerTypeId,
    required this.token,
    required this.status,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.isDeleted,
    // required this.customerGroupId,
    // required this.taxorVatNumber,
    // required this.totalOrder,
    // required this.walletBalance,
    // required this.totalRecords,
    required this.image,
    // required this.otp,
    // required this.otpDateTime,
    // required this.thirdPartyKey,
    // required this.latitued,
    // required this.longitued,
    // required this.sessionId,
    // required this.petProfileImage,
    // required this.customerGroupViewModel,
    // required this.customerAddressViewModels,
    required this.customerAddressViewModel,
    // required this.walletTransactionViewModels,
    // required this.invoiceMasterViewModel,
    // required this.invoiceMasterViewModels,
    // required this.cartResponseModels,
    // required this.customerProfileViewModels,
    required this.firstLastName,
  });

  int customerId;
  String userName;
  String firstName;
  String middleName;
  String lastName;
  String email;
  // String email2;
  String phoneNo;
  // String phoneNo2;
  // String phoneNo3;
  int gender;
  // String? dateOfBirth;
  double points;
  // String? pointInValue;
  // String? ratings;
  // String? totalOrders;
  // String? isBlacklisted;
  // String? isCorporate;
  // String? isNewsletterSub;
  // String? isReviewEnable;
  // String? isUpdatePassword;
  // String? isUpdateAddress;
  // String age;
  // String kids;
  // String pet;
  String password;
  // String accountType;
  // String? customerTypeId;
  String token;
  String status;
  // String? createdAt;
  // String? updatedAt;
  // String? isDeleted;
  // int customerGroupId;
  // String taxorVatNumber;
  // int totalOrder;
  // dynamic walletBalance;
  // int totalRecords;
  String image;
  // int otp;
  // String? otpDateTime;
  // String? thirdPartyKey;
  // String? latitued;
  // String? longitued;
  // String? sessionId;
  // String? petProfileImage;
  // CustomerGroupViewModel customerGroupViewModel;
  // List<CustomerAddressViewModel> customerAddressViewModels;
  CustomerAddressViewModel customerAddressViewModel;
  // List<dynamic> walletTransactionViewModels;
  // dynamic invoiceMasterViewModel;
  // List<dynamic> invoiceMasterViewModels;
  // dynamic cartResponseModels;
  // List<dynamic> customerProfileViewModels;
  String firstLastName;

  factory CustomerViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerViewModel(
        customerId: json["customerId"],
        userName: json["userName"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        // email2: json["email2"],
        phoneNo: json["phoneNo"],
        // phoneNo2: json["phoneNo2"],
        // phoneNo3: json["phoneNo3"],
        gender: json["gender"],
        // dateOfBirth: json["dateOfBirth"],
        points: json["points"] ?? 0.0,
        // pointInValue: json["pointInValue"],
        // ratings: json["ratings"],
        // totalOrders: json["totalOrders"],
        // isBlacklisted: json["isBlacklisted"],
        // isCorporate: json["isCorporate"],
        // isNewsletterSub: json["isNewsletterSub"],
        // isReviewEnable: json["isReviewEnable"],
        // isUpdatePassword: json["isUpdatePassword"],
        // isUpdateAddress: json["isUpdateAddress"],
        // age: json["age"],
        // kids: json["kids"],
        // pet: json["pet"],
        password: json["password"],
        // accountType: json["accountType"],
        // customerTypeId: json["customerTypeId"],
        token: json["token"],
        status: json["status"],
        // createdAt: json["createdAt"],
        // updatedAt: json["updatedAt"],
        // isDeleted: json["isDeleted"],
        // customerGroupId: json["customerGroupId"],
        // taxorVatNumber: json["taxorVatNumber"],
        // totalOrder: json["totalOrder"],
        // walletBalance: json["walletBalance"],
        // totalRecords: json["totalRecords"],
        image: json["image"] ?? '',
        // otp: json["otp"],
        // otpDateTime: json["otpDateTime"],
        // thirdPartyKey: json["thirdPartyKey"],
        // latitued: json["latitued"],
        // longitued: json["longitued"],
        // sessionId: json["sessionId"],
        // petProfileImage: json["petProfileImage"],
        // customerGroupViewModel:
        //     CustomerGroupViewModel.fromJson(json["customerGroupViewModel"]),
        // customerAddressViewModels: List<CustomerAddressViewModel>.from(
        //     json["customerAddressViewModels"]
        //         .map((x) => CustomerAddressViewModel.fromJson(x))),
        customerAddressViewModel:
            CustomerAddressViewModel.fromJson(json["customerAddressViewModel"]),
        // walletTransactionViewModels: List<dynamic>.from(
        //     json["walletTransactionViewModels"].map((x) => x)),
        // invoiceMasterViewModel: json["invoiceMasterViewModel"],
        // invoiceMasterViewModels:
        //     List<dynamic>.from(json["invoiceMasterViewModels"].map((x) => x)),
        // cartResponseModels: json["cartResponseModels"],
        // customerProfileViewModels:
        //     List<dynamic>.from(json["customerProfileViewModels"].map((x) => x)),
        firstLastName: json["firstLastName"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "userName": userName,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        // "email2": email2,
        "phoneNo": phoneNo,
        // "phoneNo2": phoneNo2,
        // "phoneNo3": phoneNo3,
        "gender": gender,
        // "dateOfBirth": dateOfBirth,
        "points": points,
        // "pointInValue": pointInValue,
        // "ratings": ratings,
        // "totalOrders": totalOrders,
        // "isBlacklisted": isBlacklisted,
        // "isCorporate": isCorporate,
        // "isNewsletterSub": isNewsletterSub,
        // "isReviewEnable": isReviewEnable,
        // "isUpdatePassword": isUpdatePassword,
        // "isUpdateAddress": isUpdateAddress,
        // "age": age,
        // "kids": kids,
        // "pet": pet,
        "password": password,
        // "accountType": accountType,
        // "customerTypeId": customerTypeId,
        "token": token,
        "status": status,
        // "createdAt": createdAt,
        // "updatedAt": updatedAt,
        // "isDeleted": isDeleted,
        // "customerGroupId": customerGroupId,
        // "taxorVatNumber": taxorVatNumber,
        // "totalOrder": totalOrder,
        // "walletBalance": walletBalance,
        // "totalRecords": totalRecords,
        "image": image,
        // "otp": otp,
        // "otpDateTime": otpDateTime,
        // "thirdPartyKey": thirdPartyKey,
        // "latitued": latitued,
        // "longitued": longitued,
        // "sessionId": sessionId,
        // "petProfileImage": petProfileImage,
        // "customerGroupViewModel": customerGroupViewModel.toJson(),
        // "customerAddressViewModels": List<dynamic>.from(
        //     customerAddressViewModels.map((x) => x.toJson())),
        "customerAddressViewModel": customerAddressViewModel.toJson(),
        // "walletTransactionViewModels":
        //     List<dynamic>.from(walletTransactionViewModels.map((x) => x)),
        // "invoiceMasterViewModel": invoiceMasterViewModel,
        // "invoiceMasterViewModels":
        //     List<dynamic>.from(invoiceMasterViewModels.map((x) => x)),
        // "cartResponseModels": cartResponseModels,
        // "customerProfileViewModels":
        //     List<dynamic>.from(customerProfileViewModels.map((x) => x)),
        "firstLastName": firstLastName,
      };
}

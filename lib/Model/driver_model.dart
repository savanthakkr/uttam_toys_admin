import 'dart:convert';

DriverModel driverModelFromJson(String str) => DriverModel.fromJson(json.decode(str));

String driverModelToJson(DriverModel data) => json.encode(data.toJson());

class DriverModel {
  bool error;
  String message;
  List<AllDriver> allDrivers;

  DriverModel({
    required this.error,
    required this.message,
    required this.allDrivers,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
    error: json["error"],
    message: json["message"],
    allDrivers: json["AllDrivers"] != null ? List<AllDriver>.from(json["AllDrivers"].map((x) => AllDriver.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "AllDrivers": List<dynamic>.from(allDrivers.map((x) => x.toJson())),
  };
}

class AllDriver {
  String id;
  String name;
  String mobile;
  String lNumber;
  String address;
  dynamic profile;
  String status;
  DateTime createdAt;

  AllDriver({
    required this.id,
    required this.name,
    required this.mobile,
    required this.lNumber,
    required this.address,
    required this.profile,
    required this.status,
    required this.createdAt,
  });

  factory AllDriver.fromJson(Map<String, dynamic> json) => AllDriver(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    lNumber: json["l_number"],
    address: json["address"],
    profile: json["profile"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "l_number": lNumber,
    "address": address,
    "profile": profile,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

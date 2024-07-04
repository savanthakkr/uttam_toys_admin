import 'dart:convert';

SchoolModel schoolModelFromJson(String str) => SchoolModel.fromJson(json.decode(str));

String schoolModelToJson(SchoolModel data) => json.encode(data.toJson());

class SchoolModel {
  bool error;
  String message;
  List<AllSchool> allSchool;

  SchoolModel({
    required this.error,
    required this.message,
    required this.allSchool,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
    error: json["error"],
    message: json["message"],
    allSchool: json["AllSchool"] != null ? List<AllSchool>.from(json["AllSchool"].map((x) => AllSchool.fromJson(x))): [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "AllSchool": List<dynamic>.from(allSchool.map((x) => x.toJson())),
  };
}

class AllSchool {
  String id;
  String areaId;
  String areaName;
  String areaLocation;
  String areaAmount;
  String schoolName;
  String schoolImage;
  String availableBus;
  String status;
  DateTime createdAt;

  AllSchool({
    required this.id,
    required this.areaId,
    required this.areaName,
    required this.areaLocation,
    required this.areaAmount,
    required this.schoolName,
    required this.schoolImage,
    required this.availableBus,
    required this.status,
    required this.createdAt,
  });

  factory AllSchool.fromJson(Map<String, dynamic> json) => AllSchool(
    id: json["id"],
    areaId: json["area_id"],
    areaName: json["area_name"],
    areaLocation: json["area_location"],
    areaAmount: json["area_amount"],
    schoolName: json["school_name"],
    schoolImage: json["school_image"],
    availableBus: json["available_bus"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area_id": areaId,
    "area_name": areaName,
    "area_location": areaLocation,
    "area_amount": areaAmount,
    "school_name": schoolName,
    "school_image": schoolImage,
    "available_bus": availableBus,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

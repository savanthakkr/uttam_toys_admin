import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  bool error;
  String message;
  List<AllArea> allArea;

  AreaModel({
    required this.error,
    required this.message,
    required this.allArea,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    error: json["error"],
    message: json["message"],
    allArea: json["AllArea"] != null ? List<AllArea>.from(json["AllArea"].map((x) => AllArea.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "AllArea": List<dynamic>.from(allArea.map((x) => x.toJson())),
  };
}

class AllArea {
  String id;
  String areaName;
  String areaLocation;
  String areaImage;
  String areaAmount;
  String totalBus;
  String status;
  DateTime createdAt;

  AllArea({
    required this.id,
    required this.areaName,
    required this.areaLocation,
    required this.areaImage,
    required this.areaAmount,
    required this.totalBus,
    required this.status,
    required this.createdAt,
  });

  factory AllArea.fromJson(Map<String, dynamic> json) => AllArea(
    id: json["id"],
    areaName: json["area_name"],
    areaLocation: json["area_location"],
    areaImage: json["area_image"],
    areaAmount: json["area_amount"],
    totalBus: json["totalBus"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area_name": areaName,
    "area_location": areaLocation,
    "area_image": areaImage,
    "area_amount": areaAmount,
    "totalBus": totalBus,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

import 'dart:convert';

VehicleProfileModel vehicleProfileModelFromJson(String str) => VehicleProfileModel.fromJson(json.decode(str));

String vehicleProfileModelToJson(VehicleProfileModel data) => json.encode(data.toJson());

class VehicleProfileModel {
  bool error;
  String message;
  List<VehicalDatum> vehicalData;

  VehicleProfileModel({
    required this.error,
    required this.message,
    required this.vehicalData,
  });

  factory VehicleProfileModel.fromJson(Map<String, dynamic> json) => VehicleProfileModel(
    error: json["error"],
    message: json["message"],
    vehicalData: json["VehicalData"] != null ? List<VehicalDatum>.from(json["VehicalData"].map((x) => VehicalDatum.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "VehicalData": List<dynamic>.from(vehicalData.map((x) => x.toJson())),
  };
}

class VehicalDatum {
  String id;
  String userId;
  String vsSmall;
  String vsMedium;
  String vsBig;
  String truckCerty;
  String transportData;
  String vImage;
  String lFront;
  String lBack;
  DateTime createdAt;

  VehicalDatum({
    required this.id,
    required this.userId,
    required this.vsSmall,
    required this.vsMedium,
    required this.vsBig,
    required this.truckCerty,
    required this.transportData,
    required this.vImage,
    required this.lFront,
    required this.lBack,
    required this.createdAt,
  });

  factory VehicalDatum.fromJson(Map<String, dynamic> json) => VehicalDatum(
    id: json["id"],
    userId: json["user_id"],
    vsSmall: json["vs_small"],
    vsMedium: json["vs_medium"],
    vsBig: json["vs_big"],
    truckCerty: json["truck_certy"],
    transportData: json["transport_data"],
    vImage: json["v_image"],
    lFront: json["l_front"],
    lBack: json["l_back"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "vs_small": vsSmall,
    "vs_medium": vsMedium,
    "vs_big": vsBig,
    "truck_certy": truckCerty,
    "transport_data": transportData,
    "v_image": vImage,
    "l_front": lFront,
    "l_back": lBack,
    "created_at": createdAt.toIso8601String(),
  };
}

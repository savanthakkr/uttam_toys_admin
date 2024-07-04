

import 'dart:convert';

RequirementDetailsModel requirementDetailsModelFromJson(String str) => RequirementDetailsModel.fromJson(json.decode(str));

String requirementDetailsModelToJson(RequirementDetailsModel data) => json.encode(data.toJson());

class RequirementDetailsModel {
  Requirement requirement;
  int totalRequirements;
  int totalSellData;
  List<SellDatum> sellData;
  bool error;

  RequirementDetailsModel({
    required this.requirement,
    required this.totalRequirements,
    required this.totalSellData,
    required this.sellData,
    required this.error,
  });

  factory RequirementDetailsModel.fromJson(Map<String, dynamic> json) => RequirementDetailsModel(
    requirement: Requirement.fromJson(json["requirement"]),
    totalRequirements: json["totalRequirements"],
    totalSellData: json["totalSellData"],
    sellData: List<SellDatum>.from(json["sellData"].map((x) => SellDatum.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "requirement": requirement.toJson(),
    "totalRequirements": totalRequirements,
    "totalSellData": totalSellData,
    "sellData": List<dynamic>.from(sellData.map((x) => x.toJson())),
    "error": error,
  };
}

class Requirement {
  int id;
  String userId;
  String title;
  String description;
  String status;
  String value;
  DateTime createdAt;
  DateTime updatedAt;

  Requirement({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.status,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) => Requirement(
    id: json["id"],
    userId: json["user_id"],
    title: json["Title"],
    description: json["Description"],
    status: json["status"],
    value: json["value"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "Title": title,
    "Description": description,
    "status": status,
    "value": value,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class SellDatum {
  int id;
  String userId;
  String requirementUserId;
  String requirementId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String mobileNumber;
  String type;
  String batchYear;

  SellDatum({
    required this.id,
    required this.userId,
    required this.requirementUserId,
    required this.requirementId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.mobileNumber,
    required this.type,
    required this.batchYear,
  });

  factory SellDatum.fromJson(Map<String, dynamic> json) => SellDatum(
    id: json["id"],
    userId: json["user_id"],
    requirementUserId: json["requirement_user_id"],
    requirementId: json["requirement_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    type: json["type"],
    batchYear: json["batchYear"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "requirement_user_id": requirementUserId,
    "requirement_id": requirementId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "mobileNumber": mobileNumber,
    "type": type,
    "batchYear": batchYear,
  };
}

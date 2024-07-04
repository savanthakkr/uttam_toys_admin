// To parse this JSON data, do
//
//     final totalCountModel = totalCountModelFromJson(jsonString);

import 'dart:convert';

TotalCountModel totalCountModelFromJson(String str) => TotalCountModel.fromJson(json.decode(str));

String totalCountModelToJson(TotalCountModel data) => json.encode(data.toJson());

class TotalCountModel {
  bool error;
  int totalService;
  int totalServiceToday;
  int totalProduct;
  int totalProductToday;
  int totalRequirement;
  int totalRequirementToday;
  int totalRequirementComplated;
  int totalRequirementComplatedToday;
  int totalRequirementLetter;

  TotalCountModel({
    required this.error,
    required this.totalService,
    required this.totalServiceToday,
    required this.totalProduct,
    required this.totalProductToday,
    required this.totalRequirement,
    required this.totalRequirementToday,
    required this.totalRequirementComplated,
    required this.totalRequirementComplatedToday,
    required this.totalRequirementLetter,
  });

  factory TotalCountModel.fromJson(Map<String, dynamic> json) => TotalCountModel(
    error: json["error"],
    totalService: json["totalService"],
    totalServiceToday: json["totalServiceToday"],
    totalProduct: json["totalProduct"],
    totalProductToday: json["totalProductToday"],
    totalRequirement: json["totalRequirement"],
    totalRequirementToday: json["totalRequirementToday"],
    totalRequirementComplated: json["totalRequirementComplated"],
    totalRequirementComplatedToday: json["totalRequirementComplatedToday"],
    totalRequirementLetter: json["totalRequirementLetter"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "totalService": totalService,
    "totalServiceToday": totalServiceToday,
    "totalProduct": totalProduct,
    "totalProductToday": totalProductToday,
    "totalRequirement": totalRequirement,
    "totalRequirementToday": totalRequirementToday,
    "totalRequirementComplated": totalRequirementComplated,
    "totalRequirementComplatedToday": totalRequirementComplatedToday,
    "totalRequirementLetter": totalRequirementLetter,
  };
}

import 'dart:convert';

RequirementModel requirementModelFromJson(String str) => RequirementModel.fromJson(json.decode(str));

String requirementModelToJson(RequirementModel data) => json.encode(data.toJson());

class RequirementModel {
  List<Requirement> requirements;
  int totalRequirements;
  bool error;

  RequirementModel({
    required this.requirements,
    required this.totalRequirements,
    required this.error,
  });

  factory RequirementModel.fromJson(Map<String, dynamic> json) => RequirementModel(
    requirements: json["requirements"] != null ? List<Requirement>.from(json["requirements"].map((x) => Requirement.fromJson(x))) : [],
    totalRequirements: json["totalRequirements"] != null ? json["totalRequirements"] : 0,
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "requirements": List<dynamic>.from(requirements.map((x) => x.toJson())),
    "totalRequirements": totalRequirements,
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
  List<String> images;

  Requirement({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.status,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
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
    images: json["images"] != null ? List<String>.from(json["images"].map((x) => x)) : [],
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
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

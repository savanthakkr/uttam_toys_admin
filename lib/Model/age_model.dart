// To parse this JSON data, do
//
//     final ageModel = ageModelFromJson(jsonString);

import 'dart:convert';

AgeModel ageModelFromJson(String str) => AgeModel.fromJson(json.decode(str));

String ageModelToJson(AgeModel data) => json.encode(data.toJson());

class AgeModel {
  bool error;
  String message;
  List<Age> age;

  AgeModel({
    required this.error,
    required this.message,
    required this.age,
  });

  factory AgeModel.fromJson(Map<String, dynamic> json) => AgeModel(
    error: json["error"],
    message: json["message"],
    age: List<Age>.from(json["age"].map((x) => Age.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "age": List<dynamic>.from(age.map((x) => x.toJson())),
  };
}

class Age {
  int id;
  String age;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Age({
    required this.id,
    required this.age,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Age.fromJson(Map<String, dynamic> json) => Age(
    id: json["id"],
    age: json["age"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "age": age,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

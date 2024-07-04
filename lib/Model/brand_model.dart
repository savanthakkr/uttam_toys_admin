// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  bool error;
  String message;
  List<Brand> brand;

  BrandModel({
    required this.error,
    required this.message,
    required this.brand,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    error: json["error"],
    message: json["message"],
    brand: List<Brand>.from(json["brand"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "brand": List<dynamic>.from(brand.map((x) => x.toJson())),
  };
}

class Brand {
  int id;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

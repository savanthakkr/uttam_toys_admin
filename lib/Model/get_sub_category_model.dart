// To parse this JSON data, do
//
//     final subCategoriesModel = subCategoriesModelFromJson(jsonString);

import 'dart:convert';

SubCategoriesModel subCategoriesModelFromJson(String str) => SubCategoriesModel.fromJson(json.decode(str));

String subCategoriesModelToJson(SubCategoriesModel data) => json.encode(data.toJson());

class SubCategoriesModel {
  List<Subcategory> subcategories;
  bool error;

  SubCategoriesModel({
    required this.subcategories,
    required this.error,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) => SubCategoriesModel(
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
    "error": error,
  };
}

class Subcategory {
  int id;
  String name;
  String image;
  String categoryName;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Subcategory({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    categoryName: json["categoryName"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "categoryName": categoryName,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

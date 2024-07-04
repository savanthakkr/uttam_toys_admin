

import 'dart:convert';

ViewProductServiceModel viewProductServiceModelFromJson(String str) => ViewProductServiceModel.fromJson(json.decode(str));

String viewProductServiceModelToJson(ViewProductServiceModel data) => json.encode(data.toJson());

class ViewProductServiceModel {
  bool error;
  String message;
  List<AllProduct> allProducts;

  ViewProductServiceModel({
    required this.error,
    required this.message,
    required this.allProducts,
  });

  factory ViewProductServiceModel.fromJson(Map<String, dynamic> json) => ViewProductServiceModel(
    error: json["error"],
    message: json["message"],
    allProducts: List<AllProduct>.from(json["allProducts"].map((x) => AllProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "allProducts": List<dynamic>.from(allProducts.map((x) => x.toJson())),
  };
}

class AllProduct {
  String userId;
  String title;
  String description;
  String type;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Image> images;

  AllProduct({
    required this.userId,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
    userId: json["user_id"],
    title: json["Title"],
    description: json["Description"],
    type: json["Type"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "Title": title,
    "Description": description,
    "Type": type,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  int id;
  String url;

  Image({
    required this.id,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}

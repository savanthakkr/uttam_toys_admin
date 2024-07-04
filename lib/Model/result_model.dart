import 'dart:convert';

ResultModel resultModelFromJson(String str) => ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
  bool error;
  String message;
  dynamic id;

  ResultModel({
    required this.error,
    required this.message,
    required this.id,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    error: json["error"],
    message: json["message"],
    id: json["ID"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "ID": id,
  };
}

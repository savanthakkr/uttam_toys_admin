import 'dart:convert';

LogsModel logsModelFromJson(String str) => LogsModel.fromJson(json.decode(str));

String logsModelToJson(LogsModel data) => json.encode(data.toJson());

class LogsModel {
  bool error;
  String message;
  List<AllLog> allLogs;

  LogsModel({
    required this.error,
    required this.message,
    required this.allLogs,
  });

  factory LogsModel.fromJson(Map<String, dynamic> json) => LogsModel(
    error: json["error"],
    message: json["message"],
    allLogs: json["AllLogs"] != null ? List<AllLog>.from(json["AllLogs"].map((x) => AllLog.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "AllLogs": List<dynamic>.from(allLogs.map((x) => x.toJson())),
  };
}

class AllLog {
  String id;
  String name;
  String itsNo;
  String mobileNo;
  String flag;
  DateTime createdAt;
  DateTime updatedAt;

  AllLog({
    required this.id,
    required this.name,
    required this.itsNo,
    required this.mobileNo,
    required this.flag,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AllLog.fromJson(Map<String, dynamic> json) => AllLog(
    id: json["id"],
    name: json["name"],
    itsNo: json["its_no"],
    mobileNo: json["mobile_no"],
    flag: json["flag"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "its_no": itsNo,
    "mobile_no": mobileNo,
    "flag": flag,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

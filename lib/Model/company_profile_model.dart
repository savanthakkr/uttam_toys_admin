import 'dart:convert';

CompanyProfileModel companyProfileModelFromJson(String str) => CompanyProfileModel.fromJson(json.decode(str));

String companyProfileModelToJson(CompanyProfileModel data) => json.encode(data.toJson());

class CompanyProfileModel {
  bool error;
  String message;
  List<CompanyDatum> companyData;

  CompanyProfileModel({
    required this.error,
    required this.message,
    required this.companyData,
  });

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) => CompanyProfileModel(
    error: json["error"],
    message: json["message"],
    companyData: json["CompanyData"] != null ? List<CompanyDatum>.from(json["CompanyData"].map((x) => CompanyDatum.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "CompanyData": List<dynamic>.from(companyData.map((x) => x.toJson())),
  };
}

class CompanyDatum {
  String id;
  String userId;
  String companyName;
  String comapnyLogo;
  String companyDesc;
  DateTime createdAt;

  CompanyDatum({
    required this.id,
    required this.userId,
    required this.companyName,
    required this.comapnyLogo,
    required this.companyDesc,
    required this.createdAt,
  });

  factory CompanyDatum.fromJson(Map<String, dynamic> json) => CompanyDatum(
    id: json["id"],
    userId: json["user_id"],
    companyName: json["company_name"],
    comapnyLogo: json["comapny_logo"],
    companyDesc: json["company_desc"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "company_name": companyName,
    "comapny_logo": comapnyLogo,
    "company_desc": companyDesc,
    "created_at": createdAt.toIso8601String(),
  };
}

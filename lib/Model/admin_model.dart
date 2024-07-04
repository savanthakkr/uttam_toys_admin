import 'dart:convert';

AdminModel adminModelFromJson(String str) => AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  bool error;
  String message;
  List<AdminProfile> adminProfile;

  AdminModel({
    required this.error,
    required this.message,
    required this.adminProfile,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
    error: json["error"],
    message: json["message"],
    adminProfile: json["AdminProfile"] != null ? List<AdminProfile>.from(json["AdminProfile"].map((x) => AdminProfile.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "AdminProfile": List<dynamic>.from(adminProfile.map((x) => x.toJson())),
  };
}

class AdminProfile {
  String id;
  String name;
  String email;
  String superadmin;
  String status;
  DateTime createdAt;

  AdminProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.superadmin,
    required this.status,
    required this.createdAt,
  });

  factory AdminProfile.fromJson(Map<String, dynamic> json) => AdminProfile(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    superadmin: json["superadmin"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "superadmin": superadmin,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

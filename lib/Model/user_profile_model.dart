import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  bool error;
  String message;
  List<UserProfile> userProfile;

  UserProfileModel({
    required this.error,
    required this.message,
    required this.userProfile,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    error: json["error"],
    message: json["message"],
    userProfile: List<UserProfile>.from(json["UserProfile"].map((x) => UserProfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "UserProfile": List<dynamic>.from(userProfile.map((x) => x.toJson())),
  };
}

class UserProfile {
  String id;
  String name;
  String email;
  String mobile;
  String ccode;
  String profile;
  String type;
  String status;
  DateTime createdAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.ccode,
    required this.profile,
    required this.type,
    required this.status,
    required this.createdAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    ccode: json["ccode"],
    profile: json["profile"],
    type: json["type"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "ccode": ccode,
    "profile": profile,
    "type": type,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool error;
  int? totalUsers;
  List<User> topUsers;
  int? totalUsersCurrentDate;
  int? totalUserToday;
  int? totalUser;
  List<User> users;

  UserModel({
    required this.error,
    this.totalUsers,
    required this.topUsers,
    this.totalUsersCurrentDate,
    this.totalUserToday,
    this.totalUser,
    required this.users,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    error: json["error"],
    totalUsers: json["totalUsers"] != null ? json["totalUsers"] : 0,
    topUsers:  json["topUsers"] != null ? List<User>.from(json["topUsers"].map((x) => User.fromJson(x))) : [],
    totalUsersCurrentDate: json["totalUsersCurrentDate"] != null ? json["totalUsersCurrentDate"] : 0,
    totalUserToday: json["TotalUserToday"] != null ? json["TotalUserToday"] : 0,
    totalUser: json["TotalUser"] != null ? json["TotalUser"] : 0,
    users: json["users"] != null ? List<User>.from(json["users"].map((x) => User.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "totalUsers": totalUsers,
    "topUsers": List<dynamic>.from(topUsers.map((x) => x.toJson())),
    "totalUsersCurrentDate": totalUsersCurrentDate,
    "TotalUserToday": totalUserToday,
    "TotalUser": totalUser,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  int id;
  String name;
  String batchYear;
  String mobileNumber;
  String type;
  String status;
  String subscriptionPlan;
  DateTime subscriptionStartDate;
  DateTime subscriptionEndDate;
  String token;
  DateTime createdAt;
  DateTime updatedAt;
  Profile? profile;

  User({
    required this.id,
    required this.name,
    required this.batchYear,
    required this.mobileNumber,
    required this.type,
    required this.status,
    required this.subscriptionPlan,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    batchYear: json["batchYear"],
    mobileNumber: json["mobileNumber"],
    type: json["type"],
    status: json["status"] != null ? json["status"] : "0",
    subscriptionPlan: json["subscriptionPlan"] != null ? json["subscriptionPlan"] : "",
    subscriptionStartDate: json["subscriptionStartDate"] != null ? DateTime.parse(json["subscriptionStartDate"]) : DateTime.now(),
    subscriptionEndDate: json["subscriptionEndDate"] != null ? DateTime.parse(json["subscriptionEndDate"]) : DateTime.now(),
    token: json["token"] != null ? json["token"] : "",
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "batchYear": batchYear,
    "mobileNumber": mobileNumber,
    "type": type,
    "status": status,
    "subscriptionPlan": subscriptionPlan,
    "subscriptionStartDate": "${subscriptionStartDate.year.toString().padLeft(4, '0')}-${subscriptionStartDate.month.toString().padLeft(2, '0')}-${subscriptionStartDate.day.toString().padLeft(2, '0')}",
    "subscriptionEndDate": "${subscriptionEndDate.year.toString().padLeft(4, '0')}-${subscriptionEndDate.month.toString().padLeft(2, '0')}-${subscriptionEndDate.day.toString().padLeft(2, '0')}",
    "token": token,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "profile": profile?.toJson(),
  };
}

class Profile {
  int id;
  String userId;
  String? businessName;
  String email;
  String? businessType;
  String? businessCategory;
  String? description;
  String? profile;
  String? cover;
  String? address;
  String? homeTwon;
  DateTime createdAt;
  DateTime updatedAt;
  String? qualification;
  String? occupation;
  String? employment;
  String? about;

  Profile({
    required this.id,
    required this.userId,
    this.businessName,
    required this.email,
    this.businessType,
    this.businessCategory,
    this.description,
    required this.profile,
    required this.cover,
    this.address,
    this.homeTwon,
    required this.createdAt,
    required this.updatedAt,
    this.qualification,
    this.occupation,
    this.employment,
    this.about,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    userId: json["user_id"],
    businessName: json["business_name"],
    email: json["email"],
    businessType: json["business_type"],
    businessCategory: json["business_category"],
    description: json["description"],
    profile: json["profile"],
    cover: json["cover"],
    address: json["address"],
    homeTwon: json["homeTwon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    qualification: json["qualification"],
    occupation: json["occupation"],
    employment: json["employment"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "business_name": businessName,
    "email": email,
    "business_type": businessType,
    "business_category": businessCategory,
    "description": description,
    "profile": profile,
    "cover": cover,
    "address": address,
    "homeTwon": homeTwon,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "qualification": qualification,
    "occupation": occupation,
    "employment": employment,
    "about": about,
  };
}

enum Type {
  BUSINESS,
  PERSONAL
}

final typeValues = EnumValues({
  "Business": Type.BUSINESS,
  "Personal": Type.PERSONAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

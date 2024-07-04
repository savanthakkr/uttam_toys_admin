import 'dart:convert';

ViewProfileModl viewProfileModlFromJson(String str) => ViewProfileModl.fromJson(json.decode(str));

String viewProfileModlToJson(ViewProfileModl data) => json.encode(data.toJson());

class ViewProfileModl {
  bool error;
  User user;

  ViewProfileModl({
    required this.error,
    required this.user,
  });

  factory ViewProfileModl.fromJson(Map<String, dynamic> json) => ViewProfileModl(
    error: json["error"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String name;
  String batchYear;
  String mobileNumber;
  String subscriptionPlan;
  DateTime subscriptionStartDate;
  DateTime subscriptionEndDate;
  String type;
  String status;
  dynamic profile;

  User({
    required this.id,
    required this.name,
    required this.batchYear,
    required this.mobileNumber,
    required this.subscriptionPlan,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.type,
    required this.status,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    batchYear: json["batchYear"] != null ? json["batchYear"] : "",
    mobileNumber: json["mobileNumber"] != null ? json["mobileNumber"] : "",
    subscriptionPlan: json["subscriptionPlan"] != null ? json["subscriptionPlan"] : "",
    subscriptionStartDate: json["subscriptionStartDate"] != null ? DateTime.parse(json["subscriptionStartDate"]) : DateTime.now(),
    subscriptionEndDate: json["subscriptionEndDate"] != null ? DateTime.parse(json["subscriptionEndDate"]) : DateTime.now(),
    type:json["type"] != null ? json["type"] : "",
    status: json['status'] != null ? json['status'] : "",
    profile: json["profile"] != null ? Profile.fromJson(json["profile"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "batchYear": batchYear,
    "mobileNumber": mobileNumber,
    "subscriptionPlan": subscriptionPlan,
    "subscriptionStartDate": "${subscriptionStartDate.year.toString().padLeft(4, '0')}-${subscriptionStartDate.month.toString().padLeft(2, '0')}-${subscriptionStartDate.day.toString().padLeft(2, '0')}",
    "subscriptionEndDate": "${subscriptionEndDate.year.toString().padLeft(4, '0')}-${subscriptionEndDate.month.toString().padLeft(2, '0')}-${subscriptionEndDate.day.toString().padLeft(2, '0')}",
    "type": type,
    "status": status,
    "profile": profile.toJson(),
  };
}

class Profile {
  int id;
  String userId;
  String email;
  String? qualification; // Nullable
  String? occupation; // Nullable
  String? employment; // Nullable
  String? about; // Nullable
  String? businessType;
  String? businessCategory;
  String? description;
  String? address;
  String address2;
  String state;
  String city;
  String pincode;
  String? homeTwon;
  dynamic profile;
  dynamic cover;
  DateTime createdAt;
  DateTime updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.email,
    this.qualification,
    this.occupation,
    this.employment,
    this.about,
    this.businessType,
    this.businessCategory,
    this.description,
    this.address,
    required this.address2,
    required this.state,
    required this.city,
    required this.pincode,
    this.homeTwon,
    required this.profile,
    required this.cover,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? "0",
    email: json["email"] ?? '',
    qualification: json["qualification"] ?? '',
    occupation: json["occupation"] ?? '',
    employment: json["employment"] ?? '',
    about: json["about"] ?? '',
    businessType: json["business_type"] ?? '',
    businessCategory: json["business_category"] ?? '',
    description: json["description"] ?? '',
    address: json["address"] ?? '',
    address2: json["address2"] ?? '',
    state: json["state"] ?? '',
    city: json["city"] ?? '',
    pincode: json["pincode"] ?? '',
    homeTwon: json["homeTwon"] ?? '',
    profile: json["profile"] ?? '',
    cover: json["cover"] ?? '',
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "email": email,
    "qualification": qualification, // Nullable
    "occupation": occupation, // Nullable
    "employment": employment, // Nullable
    "about": about, // Nullable
    "business_type": businessType,
    "business_category": businessCategory,
    "description": description,
    "address": address,
    "address2": address2,
    "state": state,
    "city": city,
    "pincode": pincode,
    "homeTwon": homeTwon,
    "profile": profile,
    "cover": cover,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

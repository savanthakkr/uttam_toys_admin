import 'dart:convert';

CurrentOrderModel currentOrderModelFromJson(String str) => CurrentOrderModel.fromJson(json.decode(str));

String currentOrderModelToJson(CurrentOrderModel data) => json.encode(data.toJson());

class CurrentOrderModel {
  bool error;
  String message;
  List<CurrentOrder> currentOrder;

  CurrentOrderModel({
    required this.error,
    required this.message,
    required this.currentOrder,
  });

  factory CurrentOrderModel.fromJson(Map<String, dynamic> json) => CurrentOrderModel(
    error: json["error"],
    message: json["message"],
    currentOrder: json["CurrentOrder"] != null ? List<CurrentOrder>.from(json["CurrentOrder"].map((x) => CurrentOrder.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "CurrentOrder": List<dynamic>.from(currentOrder.map((x) => x.toJson())),
  };
}

class CurrentOrder {
  String id;
  String userName;
  String userCode;
  String userMobile;
  String userEmail;
  String orderNumber;
  String totalAmount;
  int totalQuntity;
  String status;
  String type;
  DateTime createdAt;

  CurrentOrder({
    required this.id,
    required this.userName,
    required this.userCode,
    required this.userMobile,
    required this.userEmail,
    required this.orderNumber,
    required this.totalAmount,
    required this.totalQuntity,
    required this.status,
    required this.type,
    required this.createdAt,
  });

  factory CurrentOrder.fromJson(Map<String, dynamic> json) => CurrentOrder(
    id: json["id"],
    userName: json["user_name"],
    userCode: json["user_code"],
    userMobile: json["user_mobile"],
    userEmail: json["user_email"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    totalQuntity: json["total_quntity"],
    status: json["status"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "user_code": userCode,
    "user_mobile": userMobile,
    "user_email": userEmail,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "total_quntity": totalQuntity,
    "status": status,
    "type": type,
    "created_at": createdAt.toIso8601String(),
  };
}

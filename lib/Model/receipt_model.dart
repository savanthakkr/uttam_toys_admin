import 'dart:convert';

ReceiptModel receiptModelFromJson(String str) => ReceiptModel.fromJson(json.decode(str));

String receiptModelToJson(ReceiptModel data) => json.encode(data.toJson());

class ReceiptModel {
  bool error;
  String message;
  List<AllReceipt> allReceipt;

  ReceiptModel({
    required this.error,
    required this.message,
    required this.allReceipt,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) => ReceiptModel(
    error: json["error"],
    message: json["message"],
    allReceipt: json["AllReceipt"] != null ? List<AllReceipt>.from(json["AllReceipt"].map((x) => AllReceipt.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "AllReceipt": List<dynamic>.from(allReceipt.map((x) => x.toJson())),
  };
}

class AllReceipt {
  String id;
  String userId;
  String adminId;
  String receiptNo;
  dynamic vajebaatAmount;
  dynamic khairAmount;
  dynamic nazrulmukam;
  dynamic fmbAmount;
  dynamic sabilAmount;
  dynamic otherAmount;
  dynamic ashraAmount;
  dynamic totalAmount;
  String paymentMode;
  String fmbPaymentMode;
  String vajebaatCno;
  String vajebaatBank;
  String fmbCno;
  String fmbBank;
  String receiptDate;
  String remark;
  String sabilNo;
  String itsNo;
  String name;
  String phoneNo;
  String aname;
  String aits;
  String amobile;
  DateTime createdAt;
  DateTime updatedAt;

  AllReceipt({
    required this.id,
    required this.userId,
    required this.adminId,
    required this.receiptNo,
    required this.vajebaatAmount,
    required this.khairAmount,
    required this.nazrulmukam,
    required this.fmbAmount,
    required this.sabilAmount,
    required this.otherAmount,
    required this.ashraAmount,
    required this.totalAmount,
    required this.paymentMode,
    required this.fmbPaymentMode,
    required this.vajebaatCno,
    required this.vajebaatBank,
    required this.fmbCno,
    required this.fmbBank,
    required this.receiptDate,
    required this.remark,
    required this.sabilNo,
    required this.itsNo,
    required this.name,
    required this.phoneNo,
    required this.aname,
    required this.aits,
    required this.amobile,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AllReceipt.fromJson(Map<String, dynamic> json) => AllReceipt(
    id: json["id"],
    userId: json["user_id"],
    adminId: json["admin_id"],
    receiptNo: json["receipt_no"],
    vajebaatAmount: json["vajebaat_amount"],
    khairAmount: json["khair_amount"],
    nazrulmukam: json["nazrulmukam"],
    fmbAmount: json["fmb_amount"],
    sabilAmount: json["sabil_amount"],
    otherAmount: json["other_amount"],
    ashraAmount: json["ashra_amount"],
    totalAmount: json["total_amount"],
    paymentMode: json["payment_mode"] != null ? json["payment_mode"] : "Cash",
    fmbPaymentMode: json["fmb_payment_mode"] != null ? json["fmb_payment_mode"] : "Cash",
    vajebaatCno: json["vajebaat_cno"] != null ? json["vajebaat_cno"] : "",
    vajebaatBank: json["vajebaat_bank"] != null ? json["vajebaat_bank"] : "",
    fmbCno: json["fmb_cno"] != null ? json["fmb_cno"] : "",
    fmbBank: json["fmb_bank"] != null ? json["fmb_bank"] : "",
    receiptDate: json["receipt_date"],
    remark: json["remark"],
    sabilNo: json["sabil_no"],
    itsNo: json["its_no"],
    name: json["name"],
    phoneNo: json["phone_no"],
    aname: json["ANAME"],
    aits: json["AITS"],
    amobile: json["AMOBILE"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "admin_id": adminId,
    "receipt_no": receiptNo,
    "vajebaat_amount": vajebaatAmount,
    "khair_amount": khairAmount,
    "nazrulmukam": nazrulmukam,
    "fmb_amount": fmbAmount,
    "sabil_amount": sabilAmount,
    "other_amount": otherAmount,
    "ashra_amount": ashraAmount,
    "total_amount": totalAmount,
    "payment_mode": paymentMode,
    "fmb_payment_mode": fmbPaymentMode,
    "vajebaat_cno": vajebaatCno,
    "vajebaat_bank": vajebaatBank,
    "fmb_cno": fmbCno,
    "fmb_bank": fmbBank,
    "receipt_date": receiptDate,
    "remark": remark,
    "sabil_no": sabilNo,
    "its_no": itsNo,
    "name": name,
    "phone_no": phoneNo,
    "ANAME": aname,
    "AITS": aits,
    "AMOBILE": amobile,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

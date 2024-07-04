class UsersModel {

  String? uId;
  String? uName;
  String? ufMobile;
  String? usMobile;
  String? uEmail;
  String? uArea;
  String? uBlock;
  String? uBuilding;
  String? uFlat;
  String? uFloor;
  String? uLandmark;
  String? uStreet;
  String? uImage;
  bool? status;
  String? createdAt;

  UsersModel({
    required this.uId,
    required this.uName,
    required this.ufMobile,
    required this.usMobile,
    required this.uEmail,
    required this.uArea,
    required this.uBlock,
    required this.uBuilding,
    required this.uFlat,
    required this.uFloor,
    required this.uLandmark,
    required this.uStreet,
    required this.uImage,
    required this.status,
    required this.createdAt,
  });
}
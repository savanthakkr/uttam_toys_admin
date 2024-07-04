class RequestedAreaModel {

  String? raId;
  String? raName;
  String? raBlock;
  String? raBuilding;
  String? raStreet;
  String? raFlat;
  String? raFloor;
  String? raLandmark;
  String? uId;
  String? uName;
  String? uMobile;
  String? uEmail;
  bool? rOarea;
  bool? rApprove;
  String? cdate;

  RequestedAreaModel({
    required this.raId,
    required this.raName,
    required this.uEmail,
    required this.uId,
    required this.uName,
    required this.raBlock,
    required this.raBuilding,
    required this.raFlat,
    required this.raFloor,
    required this.raLandmark,
    required this.rApprove,
    required this.raStreet,
    required this.rOarea,
    required this.uMobile,
    required this.cdate,
  });

}
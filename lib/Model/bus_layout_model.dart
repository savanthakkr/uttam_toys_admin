class BusLayoutModel {

  String? lId;
  String? lName;
  String? tSeat;
  String? tRows;
  String? tColumns;
  bool? status;
  List<dynamic> layoutData = <dynamic>[];
  String? cDate;

  BusLayoutModel({
    required this.lId,
    required this.lName,
    required this.tSeat,
    required this.tRows,
    required this.tColumns,
    required this.layoutData,
    required this.status,
    required this.cDate,
  });

}
import 'dart:convert';
import 'dart:html';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:uttam_toys/Model/receipt_model.dart';
class GenerateExcel {

  static createuserExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("Vajebaat Amount");
    sheet.getRangeByIndex(1, 8).setText("Vajebaat Payment Mode");
    sheet.getRangeByIndex(1, 9).setText("Kare-Khair Amount");
    sheet.getRangeByIndex(1, 10).setText("Ashara 1445 Due Amount");
    sheet.getRangeByIndex(1, 11).setText("FMB Amount");
    sheet.getRangeByIndex(1, 12).setText("FMB Payment Mode");
    sheet.getRangeByIndex(1, 13).setText("Sabil Due Amount");
    sheet.getRangeByIndex(1, 14).setText("Sila-Fitra Amount");
    sheet.getRangeByIndex(1, 15).setText("Total Amount");
    sheet.getRangeByIndex(1, 16).setText("Remark");
    sheet.getRangeByIndex(1, 17).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 120);
    sheet.setColumnWidthInPixels(8, 170);
    sheet.setColumnWidthInPixels(9, 120);
    sheet.setColumnWidthInPixels(10, 170);
    sheet.setColumnWidthInPixels(11, 100);
    sheet.setColumnWidthInPixels(12, 120);
    sheet.setColumnWidthInPixels(13, 120);
    sheet.setColumnWidthInPixels(14, 100);
    sheet.setColumnWidthInPixels(14, 100);
    sheet.setColumnWidthInPixels(16, 100);
    sheet.setColumnWidthInPixels(17, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].ashraAmount == null || allReceipts[j].ashraAmount == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].ashraAmount);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == "" ? "0.00" : allReceipts[j].vajebaatAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].paymentMode);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == "" ? "0.00" : allReceipts[j].khairAmount);
      sheet.getRangeByIndex(i, 10).setText(allReceipts[j].ashraAmount == null || allReceipts[j].ashraAmount == "" ? "0.00" : allReceipts[j].ashraAmount);
      sheet.getRangeByIndex(i, 11).setText(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == "" ? "0.00" : allReceipts[j].fmbAmount);
      sheet.getRangeByIndex(i, 12).setText(allReceipts[j].fmbPaymentMode);
      sheet.getRangeByIndex(i, 13).setText(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == "" ? "0.00" : allReceipts[j].sabilAmount);
      sheet.getRangeByIndex(i, 14).setText(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == "" ? "0.00" : allReceipts[j].otherAmount);
      sheet.getRangeByIndex(i, 15).setText(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == "" ? "0.00" : allReceipts[j].totalAmount);
      sheet.getRangeByIndex(i, 16).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 17).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }

    sheet.getRangeByIndex(i, 7).setText(totalvajebaat.toString());
    sheet.getRangeByIndex(i, 9).setText(totalkher.toString());
    sheet.getRangeByIndex(i, 10).setText(totalnm.toString());
    sheet.getRangeByIndex(i, 11).setText(totalfmb.toString());
    sheet.getRangeByIndex(i, 13).setText(totalsabil.toString());
    sheet.getRangeByIndex(i, 14).setText(totalother.toString());
    sheet.getRangeByIndex(i, 15).setText(total.toString());


    var excelName = "$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }

  static createvajebaatExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("Vajebaat Amount");
    sheet.getRangeByIndex(1, 8).setText("Vajebaat Payment Mode");
    sheet.getRangeByIndex(1, 9).setText("Remark");
    sheet.getRangeByIndex(1, 10).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 120);
    sheet.setColumnWidthInPixels(8, 150);
    sheet.setColumnWidthInPixels(9, 100);
    sheet.setColumnWidthInPixels(10, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].nazrulmukam == null || allReceipts[j].nazrulmukam == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].nazrulmukam);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == "" ? "0.00" : allReceipts[j].vajebaatAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].paymentMode);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 10).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }

    sheet.getRangeByIndex(i, 7).setText(totalvajebaat.toString());

    var excelName = "vajebaat$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }

  static createkherExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("Kare-Khair Amount");
    sheet.getRangeByIndex(1, 8).setText("Remark");
    sheet.getRangeByIndex(1, 9).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 120);
    sheet.setColumnWidthInPixels(8, 100);
    sheet.setColumnWidthInPixels(9, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].nazrulmukam == null || allReceipts[j].nazrulmukam == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].nazrulmukam);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == "" ? "0.00" : allReceipts[j].khairAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }

    sheet.getRangeByIndex(i, 7).setText(totalkher.toString());

    var excelName = "kare-khair$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }

  static createnmExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("Ashara 1445 Due Amount");
    sheet.getRangeByIndex(1, 8).setText("Remark");
    sheet.getRangeByIndex(1, 9).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 170);
    sheet.setColumnWidthInPixels(8, 100);
    sheet.setColumnWidthInPixels(9, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].ashraAmount == null || allReceipts[j].ashraAmount == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].ashraAmount);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].ashraAmount == null || allReceipts[j].ashraAmount == "" ? "0.00" : allReceipts[j].ashraAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }
    sheet.getRangeByIndex(i, 7).setText(totalnm.toString());

    var excelName = "asharadue$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }

  static createfmbExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("FMB Amount");
    sheet.getRangeByIndex(1, 8).setText("FMB Payment Mode");
    sheet.getRangeByIndex(1, 9).setText("Remark");
    sheet.getRangeByIndex(1, 10).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 100);
    sheet.setColumnWidthInPixels(8, 150);
    sheet.setColumnWidthInPixels(9, 100);
    sheet.setColumnWidthInPixels(10, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].nazrulmukam == null || allReceipts[j].nazrulmukam == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].nazrulmukam);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == "" ? "0.00" : allReceipts[j].fmbAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].fmbPaymentMode);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 10).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }

    sheet.getRangeByIndex(i, 7).setText(totalfmb.toString());

    var excelName = "fmb$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }

  static createsabilExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("Sabil Due Amount");
    sheet.getRangeByIndex(1, 8).setText("Remark");
    sheet.getRangeByIndex(1, 9).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 120);
    sheet.setColumnWidthInPixels(8, 100);
    sheet.setColumnWidthInPixels(9, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].nazrulmukam == null || allReceipts[j].nazrulmukam == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].nazrulmukam);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == "" ? "0.00" : allReceipts[j].sabilAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }

    sheet.getRangeByIndex(i, 7).setText(totalsabil.toString());

    var excelName = "sabil-due$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }

  static createotherExcel(String name,List<AllReceipt> allReceipts) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("No");
    sheet.getRangeByIndex(1, 2).setText("Receipt No");
    sheet.getRangeByIndex(1, 3).setText("Sabil No");
    sheet.getRangeByIndex(1, 4).setText("ITS No");
    sheet.getRangeByIndex(1, 5).setText("Name");
    sheet.getRangeByIndex(1, 6).setText("Phone No");
    sheet.getRangeByIndex(1, 7).setText("Sila-Fitra Amount");
    sheet.getRangeByIndex(1, 8).setText("Remark");
    sheet.getRangeByIndex(1, 9).setText("Date");

    sheet.setColumnWidthInPixels(2, 80);
    sheet.setColumnWidthInPixels(3, 80);
    sheet.setColumnWidthInPixels(4, 80);
    sheet.setColumnWidthInPixels(5, 200);
    sheet.setColumnWidthInPixels(6, 80);
    sheet.setColumnWidthInPixels(7, 100);
    sheet.setColumnWidthInPixels(8, 100);
    sheet.setColumnWidthInPixels(9, 100);

    int i = 2;
    double totalvajebaat = 0.00,totalkher = 0.00,totalfmb = 0.00,totalnm = 0.00,totalsabil = 0.00,totalother = 0.00,total = 0.00;

    for (int j = 0; j < allReceipts.length; j++) {

      String dateFormat = DateFormat("ddMM").format(allReceipts.elementAt(j).createdAt);
      String rNo = dateFormat+allReceipts.elementAt(j).id;

      double vamount = 0.00,kamount=0.00,fmbamount=0.00,nmamount = 0.00,sabilamount=0.00,oamount=0.00,tamount=0.00;

      if(allReceipts[j].vajebaatAmount == null || allReceipts[j].vajebaatAmount == ""){
        vamount = 0.00;
      } else {
        vamount = double.parse(allReceipts[j].vajebaatAmount);
      }

      if(allReceipts[j].khairAmount == null || allReceipts[j].khairAmount == ""){
        kamount = 0.00;
      } else {
        kamount = double.parse(allReceipts[j].khairAmount);
      }

      if(allReceipts[j].fmbAmount == null || allReceipts[j].fmbAmount == ""){
        fmbamount = 0.00;
      } else {
        fmbamount = double.parse(allReceipts[j].fmbAmount);
      }

      if(allReceipts[j].nazrulmukam == null || allReceipts[j].nazrulmukam == ""){
        nmamount = 0.00;
      } else {
        nmamount = double.parse(allReceipts[j].nazrulmukam);
      }

      if(allReceipts[j].sabilAmount == null || allReceipts[j].sabilAmount == ""){
        sabilamount = 0.00;
      } else {
        sabilamount = double.parse(allReceipts[j].sabilAmount);
      }

      if(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == ""){
        oamount = 0.00;
      } else {
        oamount = double.parse(allReceipts[j].otherAmount);
      }

      if(allReceipts[j].totalAmount == null || allReceipts[j].totalAmount == ""){
        tamount = 0.00;
      } else {
        tamount = double.parse(allReceipts[j].totalAmount);
      }

      sheet.getRangeByIndex(i, 1).setText((j+1).toString());
      sheet.getRangeByIndex(i, 2).setText(rNo);
      sheet.getRangeByIndex(i, 3).setText(allReceipts[j].sabilNo);
      sheet.getRangeByIndex(i, 4).setText(allReceipts[j].itsNo);
      sheet.getRangeByIndex(i, 5).setText(allReceipts[j].name);
      sheet.getRangeByIndex(i, 6).setText(allReceipts[j].phoneNo);
      sheet.getRangeByIndex(i, 7).setText(allReceipts[j].otherAmount == null || allReceipts[j].otherAmount == "" ? "0.00" : allReceipts[j].otherAmount);
      sheet.getRangeByIndex(i, 8).setText(allReceipts[j].remark);
      sheet.getRangeByIndex(i, 9).setText(allReceipts[j].receiptDate);

      i += 1;
      totalvajebaat += vamount;
      totalkher += kamount;
      totalnm += nmamount;
      totalfmb += fmbamount;
      totalsabil += sabilamount;
      totalother += oamount;
      total += tamount;
    }

    sheet.getRangeByIndex(i, 7).setText(totalother.toString());

    var excelName = "Sila-Fitra$name.xlsx";

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', excelName)
      ..click();
    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', excelName)
    //     ..click();
    // } else {
    //   final String path = (await getApplicationSupportDirectory()).path;
    //   final String fileName =
    //   Platform.isWindows ? '$path\\Revenue.xlsx' : '$path/$excelName';
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);
    // }

    // EasyLoading.dismiss();
  }
}
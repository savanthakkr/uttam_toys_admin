import 'dart:typed_data';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'dart:html' as html;

class GenerateBlankReceipt{

  // static createPdf(){
  //
  //   PdfColor pdfWhite = PdfColor.fromInt(0xFFFFFFFF);
  //   PdfColor pdfBlack = PdfColor.fromInt(0x00000000);
  //   PdfColor pdfGrey = PdfColor.fromInt(0x42000000);
  //   PdfColor pdfPrimary = PdfColor.fromInt(0xff015486);
  //   PdfColor pdfLightPrimary = PdfColor.fromInt(0xffCDE8FF);
  //
  //   pw.TextStyle pdfBoldText = pw.TextStyle(
  //     color: PdfColor.fromInt(0x00000000),
  //     fontSize: 15,
  //     fontWeight: pw.FontWeight.bold,
  //     fontStyle: pw.FontStyle.normal,
  //   );
  //
  //   pw.TextStyle pdfMediumText = pw.TextStyle(
  //     color: PdfColor.fromInt(0x00000000),
  //     fontSize: 12,
  //     fontWeight: pw.FontWeight.bold,
  //     fontStyle: pw.FontStyle.normal,
  //   );
  //
  //   pw.TextStyle pdfNormalText = pw.TextStyle(
  //     color: PdfColor.fromInt(0x00000000),
  //     fontSize: 10,
  //     fontWeight: pw.FontWeight.normal,
  //     fontStyle: pw.FontStyle.normal,
  //   );
  //
  //   var pdfReciept = pw.Document();
  //   // String dateFormat = DateFormat("ddMM").format(data.createdAt);
  //   // String rNo = dateFormat+data.id;
  //
  //   pdfReciept.addPage(
  //       pw.Page(
  //           pageFormat: PdfPageFormat.a5,
  //           margin: pw.EdgeInsets.all(20.0),
  //           build: (context){
  //             return pw.Center(
  //                 child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.center,
  //                     children: [
  //                       pw.Align(
  //                         alignment: pw.Alignment.topLeft,
  //                         child: pw.Text(
  //                             "Mumineen Copy",
  //                             style: pdfNormalText.copyWith(fontSize: 8.0,color: PdfColors.grey)
  //                         ),
  //                       ),
  //                       pw.Text(
  //                           "Anjuman E Burhani Jamaat 1445 H",
  //                           style: pdfMediumText
  //                       ),
  //                       pw.Text(
  //                           "Qutbi Mohallah, Dohad",
  //                           style: pdfNormalText
  //                       ),
  //                       pw.SizedBox(height: 5.0),
  //                       pw.Divider(
  //                           height: 2,
  //                           color: PdfColors.black
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 1,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "Sabil No.: ",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 1,
  //                               child: pw.Column(
  //                                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                                   children: [
  //                                     pw.Text("Receipt No: ",style: pdfNormalText),
  //                                     pw.SizedBox(height: 5.0),
  //                                     pw.Text("Date: ",style: pdfNormalText)
  //                                   ]
  //                               ),
  //                             ),
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Container(
  //                           width: double.infinity,
  //                           padding: pw.EdgeInsets.all(10.0),
  //                           decoration: pw.BoxDecoration(
  //                               borderRadius: pw.BorderRadius.circular(10.0),
  //                               border: pw.Border.all(color: PdfColors.black)
  //                           ),
  //                           child: pw.Text(
  //                               "Name: ",
  //                               style: pdfNormalText
  //                           )
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 1,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "Phone No.: ",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 1,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "ITS No.: ",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 20.0),
  //                       pw.Divider(
  //                           height: 2,
  //                           color: PdfColors.black
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "Vajebaat Amount:",
  //                                   style: pdfNormalText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "Kare-Khair Amount:",
  //                                   style: pdfNormalText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "Ashara 1445 Due:",
  //                                   style: pdfNormalText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "FMB Thali:",
  //                                   style: pdfNormalText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "Sabil Due:",
  //                                   style: pdfNormalText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "Sila-Fitra:",
  //                                   style: pdfNormalText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfNormalText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Row(
  //                           children: [
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Text(
  //                                   "Total:",
  //                                   style: pdfBoldText
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20.0),
  //                             pw.Expanded(
  //                               flex: 3,
  //                               child: pw.Container(
  //                                   padding: pw.EdgeInsets.all(10.0),
  //                                   decoration: pw.BoxDecoration(
  //                                       borderRadius: pw.BorderRadius.circular(10.0),
  //                                       border: pw.Border.all(color: PdfColors.black,width: 1.5)
  //                                   ),
  //                                   child: pw.Text(
  //                                       "",
  //                                       style: pdfBoldText
  //                                   )
  //                               ),
  //                             ),
  //                             pw.Expanded(
  //                               flex: 4,
  //                               child: pw.Container(),
  //                             )
  //                           ]
  //                       ),
  //                       pw.SizedBox(height: 20.0),
  //                       pw.Divider(
  //                           height: 2,
  //                           color: PdfColors.black
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                       pw.Text(
  //                           "Generated receipt is only for record",
  //                           style: pdfNormalText.copyWith(fontSize: 7.0,)
  //                       ),
  //                       pw.SizedBox(height: 10.0),
  //                     ]
  //                 )
  //               // pw.Row(
  //               //     children: [
  //               //       pw.SizedBox(width: 20.0),
  //               //       pw.Expanded(
  //               //           flex: 1,
  //               //           child: pw.Column(
  //               //               crossAxisAlignment: pw.CrossAxisAlignment.center,
  //               //               children: [
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         child: pw.Text(
  //               //                             "Mumineen Copy",
  //               //                             style: pdfNormalText.copyWith(fontSize: 8.0,color: PdfColors.grey)
  //               //                         ),
  //               //                       ),
  //               //                       pw.Text(
  //               //                           "1445 H",
  //               //                           style: pdfNormalText.copyWith(fontSize: 8.0,color: PdfColors.grey)
  //               //                       ),
  //               //                     ]
  //               //                 ),
  //               //                 pw.Text(
  //               //                     "Anjuman E Burhani Jamaat 1445 H",
  //               //                     style: pdfMediumText
  //               //                 ),
  //               //                 pw.Text(
  //               //                     "Qutbi Mohallah, Dohad",
  //               //                     style: pdfNormalText
  //               //                 ),
  //               //                 pw.SizedBox(height: 5.0),
  //               //                 pw.Divider(
  //               //                     height: 2,
  //               //                     color: PdfColors.black
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 "Sabil No.: ${_sabilController.text.trim()}",
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Column(
  //               //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               //                             children: [
  //               //                               pw.Text("Receipt No: $rNo",style: pdfNormalText),
  //               //                               pw.SizedBox(height: 5.0),
  //               //                               pw.Text("Date: ${data.receiptDate}",style: pdfNormalText)
  //               //                             ]
  //               //                         ),
  //               //                       ),
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Container(
  //               //                     width: double.infinity,
  //               //                     padding: pw.EdgeInsets.all(10.0),
  //               //                     decoration: pw.BoxDecoration(
  //               //                         borderRadius: pw.BorderRadius.circular(10.0),
  //               //                         border: pw.Border.all(color: PdfColors.black)
  //               //                     ),
  //               //                     child: pw.Text(
  //               //                         "Name: ${data.name}",
  //               //                         style: pdfNormalText
  //               //                     )
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 "Phone No.: ${data.phoneNo}",
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 "ITS No.: ${data.itsNo}",
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 20.0),
  //               //                 pw.Divider(
  //               //                     height: 2,
  //               //                     color: PdfColors.black
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Vajebaat Amount:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.vajebaatAmount == null || data.vajebaatAmount == "" ? "0.00" : data.vajebaatAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Kare-Khair Amount:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.khairAmount == null || data.khairAmount == "" ? "0.00" : data.khairAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Ashara 1445 Due:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.ashraAmount == null || data.ashraAmount == "" ? "0.00" : data.ashraAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "FMB Thali:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.fmbAmount == null || data.fmbAmount == "" ? "0.00" : data.fmbAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Sabil Due:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.sabilAmount == null || data.sabilAmount == "" ? "0.00" : data.sabilAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Other:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.otherAmount == null || data.otherAmount == "" ? "0.00" : data.otherAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Total:",
  //               //                             style: pdfBoldText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black,width: 1.5)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.totalAmount == null || data.totalAmount == "" ? "0.00" : data.totalAmount,
  //               //                                 style: pdfBoldText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 20.0),
  //               //                 pw.Divider(
  //               //                     height: 2,
  //               //                     color: PdfColors.black
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Text(
  //               //                     "Generated receipt is only for record",
  //               //                     style: pdfNormalText.copyWith(fontSize: 7.0,)
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //               ]
  //               //           )
  //               //       ),
  //               //       pw.SizedBox(width: 20.0),
  //               //       pw.VerticalDivider(width: 2,color: PdfColors.black),
  //               //       pw.SizedBox(width: 20.0),
  //               //       pw.Expanded(
  //               //           flex: 1,
  //               //           child: pw.Column(
  //               //               crossAxisAlignment: pw.CrossAxisAlignment.center,
  //               //               children: [
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         child: pw.Text(
  //               //                             "Office Copy",
  //               //                             style: pdfNormalText.copyWith(fontSize: 8.0,color: PdfColors.grey)
  //               //                         ),
  //               //                       ),
  //               //                       pw.Text(
  //               //                           "1445 H",
  //               //                           style: pdfNormalText.copyWith(fontSize: 8.0,color: PdfColors.grey)
  //               //                       ),
  //               //                     ]
  //               //                 ),
  //               //                 pw.Text(
  //               //                     "Anjuman E Burhani Jamaat",
  //               //                     style: pdfMediumText
  //               //                 ),
  //               //                 pw.Text(
  //               //                     "Qutbi Mohallah, Dohad",
  //               //                     style: pdfNormalText
  //               //                 ),
  //               //                 pw.SizedBox(height: 5.0),
  //               //                 pw.Divider(
  //               //                     height: 2,
  //               //                     color: PdfColors.black
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 "Sabil No.: ${data.sabilNo}",
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Column(
  //               //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               //                             children: [
  //               //                               pw.Text("Receipt No: $rNo",style: pdfNormalText),
  //               //                               pw.SizedBox(height: 5.0),
  //               //                               pw.Text("Date: ${data.receiptDate}",style: pdfNormalText)
  //               //                             ]
  //               //                         ),
  //               //                       ),
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Container(
  //               //                     width: double.infinity,
  //               //                     padding: pw.EdgeInsets.all(10.0),
  //               //                     decoration: pw.BoxDecoration(
  //               //                         borderRadius: pw.BorderRadius.circular(10.0),
  //               //                         border: pw.Border.all(color: PdfColors.black)
  //               //                     ),
  //               //                     child: pw.Text(
  //               //                         "Name: ${data.name}",
  //               //                         style: pdfNormalText
  //               //                     )
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 "Phone No.: ${data.phoneNo}",
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 1,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 "ITS No.: ${data.itsNo}",
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 20.0),
  //               //                 pw.Divider(
  //               //                     height: 2,
  //               //                     color: PdfColors.black
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Vajebaat Amount:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.vajebaatAmount == null || data.vajebaatAmount == "" ? "0.00" : data.vajebaatAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Kare-Khair Amount:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.khairAmount == null || data.khairAmount == "" ? "0.00" : data.khairAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Ashara 1445 Due:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.ashraAmount == null || data.ashraAmount == "" ? "0.00" : data.ashraAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "FMB Thali:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.fmbAmount == null || data.fmbAmount == "" ? "0.00" : data.fmbAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Sabil Due:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.sabilAmount == null || data.sabilAmount == "" ? "0.00" : data.sabilAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Other:",
  //               //                             style: pdfNormalText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.otherAmount == null || data.otherAmount == "" ? "0.00" : data.otherAmount,
  //               //                                 style: pdfNormalText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Row(
  //               //                     children: [
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Text(
  //               //                             "Total:",
  //               //                             style: pdfBoldText
  //               //                         ),
  //               //                       ),
  //               //                       pw.SizedBox(width: 20.0),
  //               //                       pw.Expanded(
  //               //                         flex: 3,
  //               //                         child: pw.Container(
  //               //                             padding: pw.EdgeInsets.all(10.0),
  //               //                             decoration: pw.BoxDecoration(
  //               //                                 borderRadius: pw.BorderRadius.circular(10.0),
  //               //                                 border: pw.Border.all(color: PdfColors.black,width: 1.5)
  //               //                             ),
  //               //                             child: pw.Text(
  //               //                                 data.totalAmount == null || data.totalAmount == "" ? "0.00" : data.totalAmount,
  //               //                                 style: pdfBoldText
  //               //                             )
  //               //                         ),
  //               //                       ),
  //               //                       pw.Expanded(
  //               //                         flex: 4,
  //               //                         child: pw.Container(),
  //               //                       )
  //               //                     ]
  //               //                 ),
  //               //                 pw.SizedBox(height: 20.0),
  //               //                 pw.Divider(
  //               //                     height: 2,
  //               //                     color: PdfColors.black
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //                 pw.Text(
  //               //                     "Generated receipt is only for record",
  //               //                     style: pdfNormalText.copyWith(fontSize: 7.0,)
  //               //                 ),
  //               //                 pw.SizedBox(height: 10.0),
  //               //               ]
  //               //           )
  //               //       ),
  //               //       pw.SizedBox(width: 20.0),
  //               //     ]
  //               // )
  //
  //             );
  //           }
  //       )
  //   );
  //   savePDF(pdfReciept);
  // }
  //
  // static savePDF(var pdfReciept) async {
  //
  //   String rNo = DateTime.now().millisecondsSinceEpoch.toString();
  //
  //   Uint8List pdfInBytes = await pdfReciept.save();
  //   final blob = html.Blob([pdfInBytes], 'application/pdf');
  //   final url = html.Url.createObjectUrlFromBlob(blob);
  //   var anchor = html.document.createElement('a') as html.AnchorElement
  //     ..href = url
  //     ..style.display = 'none'
  //     ..download = '$rNo.pdf';
  //   html.document.body!.children.add(anchor);
  //   anchor.click();
  // }

}
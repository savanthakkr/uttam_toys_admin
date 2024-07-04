import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uttam_toys/Model/details_requirement_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

import '../../generated/l10n.dart';

class ViewBookingScreen extends StatefulWidget {

  String userId;

  ViewBookingScreen({super.key,required this.userId});

  @override
  State<ViewBookingScreen> createState() => _ViewBookingScreenState();
}

class _ViewBookingScreenState extends State<ViewBookingScreen> {

  bool _isLoading = false;
  int status = 0;
  String rName = "";
  // int totalRequitement = 0;
  int totalSellData = 0;
  String rDescription = "";
  dynamic layoutData;

  List<SellDatum> sellDataDetails = <SellDatum>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    setState(() {
      _isLoading = true;
    });

    try{
      final RequirementDetailsModel responseModel = await ApiManager.FetchRequirementDetails(widget.userId);
      if(responseModel.error == false) {
        setState(() {
          rName = responseModel.requirement.title;
          rDescription = responseModel.requirement.description;
          sellDataDetails = responseModel.sellData;
          // totalRequitement = responseModel.totalRequirements;
          totalSellData = responseModel.totalSellData;
          _isLoading = false;
        });



      } else{
        setState(() {
          _isLoading = false;
        });
        _onLoginError(context, "Requirement not found");
      }
    }
    on Exception catch(_,e){
      setState(() {
        _isLoading = false;
      });
      _onLoginError(context, e.toString());
      print(e.toString());
    }
  }

  void _onLoginError(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      desc: message,
      width: kDialogWidth,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    );

    dialog.show();
  }




  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final appColorScheme = themeData.extension<AppColorScheme>()!;
    final appDataTableTheme = themeData.extension<AppDataTableTheme>()!;

    return SelectionArea(
      child: PortalMasterLayout(
        body: _isLoading ? Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: SizedBox(
            height: 40.0,
            width: 40.0,
            child: CircularProgressIndicator(
              backgroundColor: themeData.scaffoldBackgroundColor,
            ),
          ),
        ) : Align(
          alignment: Alignment.topLeft,
          child: ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      lang.requirmentdetails(1),
                      style: themeData.textTheme.headlineMedium,
                    ),
                  ),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: kPrimaryColor,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20), // button's shape
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       context.goNamed(
                  //         "assignBus",
                  //       );
                  //     },
                  //     child: Padding(
                  //         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  //         child: Text("Assign Bus",style: GoogleFonts.inter(fontSize: 14.0,fontWeight: FontWeight.w800,color: Colors.white),)))
                  // GestureDetector(
                  //   onTap: (){
                  //     context.goNamed(
                  //       "addarea",
                  //     );
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(15.0),
                  //     decoration: BoxDecoration(
                  //         color: kPrimaryColor,
                  //         borderRadius: BorderRadius.circular(15.0)
                  //     ),
                  //     child: Text(
                  //       "Add Area",
                  //       style: GoogleFonts.inter(
                  //         fontSize: 14.0,
                  //         fontWeight: FontWeight.w800,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CardHeader(
                        title: lang.requirmentdetails(1),
                      ),
                      CardBody(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Requirement Information: ",
                                    style: themeData.textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 20.0,),
                                  // Center(child: Image.network(qrcode)),
                                  // SizedBox(height: 20.0,),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                              text: 'Name:  ',
                                              style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                  text: rName
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0,),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                              text: 'Total User Sell Count:  ',
                                              style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                    style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                    text: totalSellData.toString()
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0,),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                              text: 'Description:  ',
                                              style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                    style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                    text: rDescription
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Sell It Information: ",
                                    style: themeData.textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 20.0,),
                                  ListView.builder(
                                      itemBuilder: (context,index){
                                        return rawSell(index);
                                      },
                                    itemCount: sellDataDetails.length,
                                    shrinkWrap: true,

                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  rawSell(int index){
    return Container(
      // child: Text(sellDataDetails.elementAt(index).name),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text.rich(
              TextSpan(
                  text: 'Name:  ',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                        text: sellDataDetails.elementAt(index).name
                    )
                  ]
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text.rich(
              TextSpan(
                  text: ' Mobile No:  ',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                        text: sellDataDetails.elementAt(index).mobileNumber
                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }




}

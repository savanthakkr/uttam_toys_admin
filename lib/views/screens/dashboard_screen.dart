import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uttam_toys/Model/total_count_all.dart';
import 'package:uttam_toys/Model/user_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_button_theme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();
  bool _isLoading = true;
  String totalUser = "0", totalBUser = "0",totalBUserCurrent = "0",  totalProductToday = "0", totalRequirement = "0", totalRequirementToday = "0", totalRequirementComplated = "0" ;
  String totalUserCurrent = "0", totalPUser = "0",totalPUserCurrent = "0" ,totalService = "0", totalServiceToday = "0", totalProduct = "0", totalRequirementComplatedToday = "0", totalRequirementLetter = "0"  ;
  String topUser1 = "0", topUser2 = "0",topUser3 = "0";
  List<User> usermodelList = <User>[];


  String name = "";


  String tcvajebaat = "0", tovajebaat = "0", tcfmb = "0",tofmb = "0";
  String ocvajebaat = "0", oovajebaat = "0", ocfmb = "0",oofmb = "0";

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchReceipt();
    // fetchReceipttoday();
    // fetchUser();
    // fetchUserPersonal();
    // fetchUserCountAll();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final appColorScheme = Theme.of(context).extension<AppColorScheme>()!;
    final appDataTableTheme = Theme.of(context).extension<AppDataTableTheme>()!;
    final size = MediaQuery.of(context).size;

    final summaryCardCrossAxisCount = (size.width >= kScreenWidthLg ? 4 : 2);

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            lang.dashboard,
            style: themeData.textTheme.headlineMedium,
          ),

          SizedBox(height: 20.0,),
          Text(
            "Most Selling User",
            style: themeData.textTheme.titleMedium,
          ),
          SizedBox(height: 20.0,),
          activeWidget(),
          SizedBox(height: 20.0,),
          Text(
            lang.overall,
            style: themeData.textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth - (kDefaultPadding * (summaryCardCrossAxisCount - 1))) / summaryCardCrossAxisCount);

                return Wrap(
                  direction: Axis.horizontal,
                  spacing: kDefaultPadding,
                  runSpacing: kDefaultPadding,
                  children: [
                    SummaryCard(
                      title: lang.totalUser(2),
                      value: totalUser,
                      icon: Icons.group_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalBuser(2),
                      value: totalBUser,
                      icon: Icons.credit_card_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalPuser(2),
                      value: totalPUser,
                      icon: Icons.credit_card_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalRequirement(2),
                      value: totalRequirement,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalCompleteRequirement(2),
                      value: totalRequirementComplated,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalProduct(2),
                      value: totalProduct,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalService(2),
                      value: totalService,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalRequirementLetter(2),
                      value: totalRequirementLetter,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),

                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            lang.today,
            style: themeData.textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth - (kDefaultPadding * (summaryCardCrossAxisCount - 1))) / summaryCardCrossAxisCount);

                return Wrap(
                  direction: Axis.horizontal,
                  spacing: kDefaultPadding,
                  runSpacing: kDefaultPadding,
                  children: [
                    SummaryCard(
                      title: lang.totalUser(2),
                      value: totalUserCurrent,
                      icon: Icons.group_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalBuser(2),
                      value: totalBUserCurrent,
                      icon: Icons.credit_card_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalPuser(2),
                      value: totalPUserCurrent,
                      icon: Icons.credit_card_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalRequirement(2),
                      value: totalRequirementToday,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalCompleteRequirement(2),
                      value: totalRequirementComplatedToday,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalProduct(2),
                      value: totalProductToday,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.totalService(2),
                      value: totalServiceToday,
                      icon: Icons.sms_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    // SummaryCard(
                    //   title: lang.totalOther(2),
                    //   value: tother,
                    //   icon: Icons.sms_rounded,
                    //   backgroundColor: appColorScheme.warning,
                    //   textColor: appColorScheme.buttonTextBlack,
                    //   iconColor: Colors.black12,
                    //   width: summaryCardWidth,
                    // ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  activeWidget(){
    return ListView.builder(
      itemBuilder: (context,index){
        return rawActive(index);
      },
      itemCount: usermodelList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  rawActive(int index){
    final themeData = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [

            Expanded(
              child: Text(
                "Name: ",
                style: themeData.textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: Text(
                name = usermodelList.elementAt(index).name,
                style: themeData.textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: Text(
                "Number: ",
                style: themeData.textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: Text(
                usermodelList.elementAt(index).mobileNumber,
                style: themeData.textTheme.titleMedium,
              ),
            ),
          ],
        ),
        SizedBox(),
        Divider(
          color: Colors.black,
          thickness: 1.5,
        ),
      ],
    );
  }



  // fetchUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try{
  //     final UserModel responseModel = await ApiManager.FetchUserApi();
  //     if(responseModel.error == false) {
  //       setState(() {
  //         totalBUser = responseModel.totalUsers.toString();
  //         usermodelList = responseModel.topUsers;
  //         totalBUserCurrent = responseModel.totalUsersCurrentDate.toString();
  //         _isLoading = false;
  //       });
  //
  //     } else{
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       _onLoginError(context, "User not found");
  //     }
  //   }
  //   on Exception catch(_,e){
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     _onLoginError(context, e.toString());
  //     print(e.toString());
  //   }
  // }


  // fetchUserCountAll() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try{
  //     final TotalCountModel responseModel = await ApiManager.FetchUserCountAllApi();
  //     if(responseModel.error == false) {
  //       setState(() {
  //         totalRequirement = responseModel.totalRequirement.toString();
  //         totalRequirementToday = responseModel.totalRequirementToday.toString();
  //         totalRequirementComplated = responseModel.totalRequirementComplated.toString();
  //         totalRequirementComplatedToday = responseModel.totalRequirementComplatedToday.toString();
  //         totalRequirementLetter = responseModel.totalRequirementLetter.toString();
  //         totalProduct = responseModel.totalProduct.toString();
  //         totalProductToday = responseModel.totalProductToday.toString();
  //         totalService = responseModel.totalService.toString();
  //         totalServiceToday = responseModel.totalServiceToday.toString();
  //         _isLoading = false;
  //       });
  //
  //     } else{
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       _onLoginError(context, "User not found");
  //     }
  //   }
  //   on Exception catch(_,e){
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     _onLoginError(context, e.toString());
  //     print(e.toString());
  //   }
  // }

  // fetchUserPersonal() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try{
  //     final UserModel responseModel = await ApiManager.FetchUserApiPersonal();
  //     if(responseModel.error == false) {
  //       setState(() {
  //         totalPUser = responseModel.totalUsers.toString();
  //         totalPUserCurrent = responseModel.totalUsersCurrentDate.toString();
  //         totalUser = responseModel.totalUser.toString();
  //         totalUserCurrent = responseModel.totalUserToday.toString();
  //         _isLoading = false;
  //       });
  //
  //     } else{
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       _onLoginError(context, "User not found");
  //     }
  //   }
  //   on Exception catch(_,e){
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     _onLoginError(context, e.toString());
  //     print(e.toString());
  //   }
  // }

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



}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 120.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Stack(
          children: [
            // Positioned(
            //   top: kDefaultPadding * 0.5,
            //   right: kDefaultPadding * 0.5,
            //   child: Icon(
            //     icon,
            //     size: 80.0,
            //     color: iconColor,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.headlineMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCardNew extends StatelessWidget {
  final String title;
  final String value;
  final String cashvalue;
  final String chequqvalue;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummaryCardNew({
    Key? key,
    required this.title,
    required this.value,
    required this.cashvalue,
    required this.chequqvalue,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 120.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Stack(
          children: [
            Positioned(
              top: kDefaultPadding * 0.3,
              right: kDefaultPadding * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cashvalue,
                    style: textTheme.headlineMedium!.copyWith(
                      color: textColor,
                    ),
                  ),
                  Text(
                    "Cash",
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                  Text(
                    chequqvalue,
                    style: textTheme.headlineMedium!.copyWith(
                      color: textColor,
                    ),
                  ),
                  Text(
                    "Cheque",
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.headlineMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

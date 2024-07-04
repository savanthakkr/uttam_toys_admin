import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uttam_toys/Model/result_model.dart';
import 'package:uttam_toys/Model/view_profile_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

class ViewProfileDetails extends StatefulWidget {
  final String userId;

  ViewProfileDetails({super.key, required this.userId});

  @override
  State<ViewProfileDetails> createState() => _ViewProfileDetailsState();
}

class _ViewProfileDetailsState extends State<ViewProfileDetails> {
  bool _isLoading = false;
  String rName = "";
  String rDescription = "";
  String batchYear = "";
  String mobilenumber = "";
  String type = "";
  String qualification = "";
  String occupation = "";
  String employment = "";
  String about = "";


  String businessType = "";
  String planDetails = "";
  String planStart = "";
  String planEnd = "";
  String businessCategory = "";
  String description = "";
  String address = "";
  String address2 = "";
  String state = "";
  String city = "";
  String pincode = "";
  String homeTwon = "";

  String fullAddress = "";
  bool isActive = false;


  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final ViewProfileModl responseModel = await ApiManager.FetchUserApiPersonalProfile(widget.userId);

      if (responseModel.error == false) {
        setState(() {
          if(responseModel.user.profile != null){
            rName = responseModel.user.name ?? "null";
            batchYear = responseModel.user.batchYear ?? "null";
            mobilenumber = responseModel.user.mobileNumber ?? "null";
            rDescription = responseModel.user.profile.email ?? "null";
            type = responseModel.user.type ?? "null";
            qualification = responseModel.user.profile.qualification ?? "null";
            occupation = responseModel.user.profile.occupation ?? "null";
            employment = responseModel.user.profile.employment ?? "null";
            about = responseModel.user.profile.about ?? "null";

            planDetails = responseModel.user.subscriptionPlan;
            planStart = responseModel.user.subscriptionStartDate.toString();
            planEnd = responseModel.user.subscriptionEndDate.toString();
            businessType = responseModel.user.profile.businessType ?? "null";
            businessCategory = responseModel.user.profile.businessCategory ?? "null";
            description = responseModel.user.profile.description ?? "null";
            address = responseModel.user.profile.address ?? "null";
            address2 = responseModel.user.profile.address2 ?? "null";
            state = responseModel.user.profile.state ?? "null";
            city = responseModel.user.profile.city ?? "null";
            pincode = responseModel.user.profile.pincode ?? "null";
            homeTwon = responseModel.user.profile.homeTwon ?? "null";
            fullAddress = address + address2;

            if(responseModel.user.status == "0"){
              setState(() {
                isActive = true;
              });
            } else {
              setState(() {
                isActive = false;
              });
            }
          }else{
            print("objectobjectobjectobjectobjectobjectobject");

          }


          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        _onLoginError(context, "Requirement not found");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _onLoginError(context, "Error fetching user data: $e");
      print("Error fetching user data: $e");
    }
  }

  verifyUser(String status) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final ResultModel responseModel = await ApiManager.VerifyBusinessProfile(widget.userId,status);

      if (responseModel.error == false) {
        setState(() {
          _isLoading = false;
        });
        fetchUser();
      } else {
        setState(() {
          _isLoading = false;
        });
        _onLoginError(context, responseModel.message);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _onLoginError(context, "Error fetching user data: $e");
      print("Error fetching user data: $e");
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
        body: _isLoading
            ? Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: SizedBox(
            height: 40.0,
            width: 40.0,
            child: CircularProgressIndicator(
              backgroundColor: themeData.scaffoldBackgroundColor,
            ),
          ),
        )
            : Align(
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
                      lang.profiledetails(1),
                      style: themeData.textTheme.headlineMedium,
                    ),
                  ),
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
                        title: lang.profiledetails(1),
                      ),
                      CardBody(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Profile Information: ",
                                    style: themeData.textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 20.0),
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
                                                text: rName ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'Email:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: rDescription ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'BatchYear:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: batchYear ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'Mobile Number:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: mobilenumber ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'Tyep:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: type ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'Profile:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: "Profile",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: type == "Business" ? "Business Type: " :'Employment:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: type == "Business" ? businessType ?? "null" : employment ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: type == "Business" ? "Business Category: " : 'Occupation:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: type == "Business" ? businessCategory ?? "null" : occupation ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: type == "Business" ? "description: " : 'About:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: type == "Business" ? description ?? "null" : about ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: type == "Business" ? "address: " : 'Qualification:  ',
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text: type == "Business" ? fullAddress ?? "null" : qualification ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Home town: ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  homeTwon ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Subscription Plan : ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  planDetails ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Plan Start: ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  planStart ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Plan End: ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  planEnd ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "State: ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  state ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "City : ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  city ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Pincode : ",
                                            style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                text:  pincode ?? "null",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ): Container(),
                                      type == "Business" ? Expanded(
                                        flex: 1,
                                        child: Switch(
                                          value: isActive,
                                          onChanged: (value){
                                            setState(() {
                                              isActive = value;
                                            });
                                            if(isActive){
                                              verifyUser("0");
                                            } else {
                                              verifyUser("1");
                                            }
                                          },
                                          activeColor: kPrimaryColor,
                                        ),
                                      ) : Container()
                                    ],
                                  ),
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
}

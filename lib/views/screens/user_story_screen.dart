import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:uttam_toys/Model/result_model.dart';
import 'package:uttam_toys/Model/user_story_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

class UserStoryScreen extends StatefulWidget {

  String userId;
  UserStoryScreen({super.key,required this.userId});

  @override
  State<UserStoryScreen> createState() => _UserStoryScreenState();
}

class _UserStoryScreenState extends State<UserStoryScreen> {

  late UserDataModel _userDataModel;
  List<UserStory> usermodelList = <UserStory>[];
  List<UserStory> filterList = <UserStory>[];
  bool _isLoading = false;
  int _totalPageCount = 1;
  late int rangeEnd,rangeStart;
  var selectedPageNumber = 1;
  late int currentPage;
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _sortAscending = true;
  int _sortColumnIndex=0;
  List<String> planList = <String>[
    "All",
    "Silver",
    "Gold",
    "Platinum",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  void _sort<T>(Comparable<T> Function(UserStory d) getField, int columnIndex, bool ascending) {
    _userDataModel._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  fetchUser() async {
    usermodelList.clear();
    filterList.clear();
    setState(() {
      _isLoading = true;
    });

    try{
      final UserStoryModel responseModel = await ApiManager.FetchUserStory(widget.userId);
      if(responseModel.error == false) {
        setState(() {
          usermodelList = responseModel.userStory;
          filterList = responseModel.userStory;

          _userDataModel = UserDataModel(
            onViewButtonPressed: (data){
              // updatedDialouge(data);
            },
            usermodelList: filterList,
            onDeleteButtonPressed: (String sid,String status) {
              verifyStory(sid, status);
            },
          );
          _isLoading = false;
        });

      } else{
        setState(() {
          _isLoading = false;
        });
        _onLoginError(context, "User not found");
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

  void _onSuccess(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
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
    final _scrollController = ScrollController();

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
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      lang.userstory(1),
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
                  //       // context.goNamed(
                  //       //   "adduser",
                  //       // );
                  //     },
                  //     child: Padding(
                  //         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  //         child: Text("Add User",style: GoogleFonts.inter(fontSize: 14.0,fontWeight: FontWeight.w800,color: Colors.white),)))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardHeader(
                        title: lang.userstory(1),
                      ),
                      CardBody(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
                              child: FormBuilder(
                                key: _formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    spacing: kDefaultPadding,
                                    runSpacing: kDefaultPadding,
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Padding(
                                      //         padding: EdgeInsets.only(right: kDefaultPadding * 1.5,),
                                      //         child: FormBuilderTextField(
                                      //           name: 'search',
                                      //           onChanged: (value){
                                      //             setState(() {
                                      //               // filterList.clear();
                                      //               filterList = usermodelList.where(
                                      //                       (area) => area.name.toLowerCase().contains(value!) || area.mobileNumber.toLowerCase().contains(value)).toList();
                                      //
                                      //               _userDataModel = UserDataModel(
                                      //                 onViewButtonPressed: (data){
                                      //
                                      //                 },
                                      //                 usermodelList: filterList,
                                      //                 onDeleteButtonPressed: (User data) {
                                      //                   // openDeleteDialouge(data);
                                      //                 },
                                      //               );
                                      //             });
                                      //           },
                                      //           decoration: InputDecoration(
                                      //             labelText: lang.search,
                                      //             hintText: lang.search,
                                      //             border: const OutlineInputBorder(),
                                      //             floatingLabelBehavior: FloatingLabelBehavior.always,
                                      //             isDense: true,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(width: 10.0,),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.only(right: kDefaultPadding * 1.5),
                                      //         child: Theme(
                                      //           data: Theme.of(context).copyWith(
                                      //             // canvasColor: Colors.amber,
                                      //             splashColor: Colors.amber,
                                      //           ),
                                      //           child: FormBuilderDropdown(
                                      //             name: 'Subscription Plan',
                                      //             style: themeData.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,fontSize: 16),
                                      //             decoration: InputDecoration(
                                      //               contentPadding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                                      //               border: OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
                                      //               enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
                                      //               focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
                                      //               hoverColor: Colors.transparent,
                                      //               focusColor: Colors.transparent,
                                      //             ),
                                      //             allowClear: true,
                                      //             focusColor: Colors.transparent,
                                      //             isExpanded: true,
                                      //             isDense: false,
                                      //             elevation: 0,
                                      //             hint: Text('Subscription Plan',style: themeData.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.grey.shade600),),
                                      //             items: planList.map((e) => DropdownMenuItem(
                                      //                 value: e, child: Text(e))).toList(),
                                      //             onChanged: (value){
                                      //               bool isEnable = true;
                                      //               String data = value!;
                                      //               setState(() {
                                      //                 // filterList.clear();
                                      //                 if(data == "All"){
                                      //                   filterList = usermodelList;
                                      //                 } else {
                                      //                   filterList = usermodelList.where((area) => area.subscriptionPlan == data).toList();
                                      //                 }
                                      //                 _userDataModel = UserDataModel(
                                      //                   onViewButtonPressed: (data){
                                      //
                                      //                   },
                                      //                   usermodelList: filterList,
                                      //                   onDeleteButtonPressed: (User data) {
                                      //                     // openDeleteDialouge(data);
                                      //                   },
                                      //                 );
                                      //
                                      //               });
                                      //             },
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            filterList.isNotEmpty ? SizedBox(
                              width: double.infinity,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final double dataTableWidth = max(kScreenWidthMd, constraints.maxWidth);

                                  return Scrollbar(
                                    controller: _scrollController,
                                    thumbVisibility: true,
                                    trackVisibility: true,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollController,
                                      child: SizedBox(
                                        width: dataTableWidth,
                                        child: Theme(
                                          data: themeData.copyWith(
                                              cardTheme: appDataTableTheme.cardTheme,
                                              dataTableTheme: appDataTableTheme.dataTableThemeData,
                                              iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
                                              dividerColor: Colors.grey.shade200,
                                              dividerTheme: Theme.of(context).dividerTheme.copyWith(thickness: 0,color: Colors.transparent,endIndent: 0,indent: 0,space: 0)
                                          ),
                                          child: PaginatedDataTable(
                                            source: _userDataModel,
                                            rowsPerPage: filterList.length > 20 ? 20 : filterList.length,
                                            showCheckboxColumn: false,
                                            showFirstLastButtons: true,
                                            sortColumnIndex: _sortColumnIndex,
                                            sortAscending: _sortAscending,
                                            dataRowHeight: 80,
                                            columns: [
                                              DataColumn(label: Text('No.'), numeric: true),
                                              DataColumn(label: Text('Image'),),
                                              DataColumn(label: Text('Time')),
                                             DataColumn(label: Text('Actions')),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ) : Container(),
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

  verifyStory(String id,String status) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final ResultModel responseModel = await ApiManager.VerifyStory(id,status);

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
}

class UserDataModel extends DataTableSource {
  final void Function(Map<String, dynamic> data) onViewButtonPressed;
  final void Function(String sId,String status) onDeleteButtonPressed;
  final List<UserStory> usermodelList;

  UserDataModel({
    required this.onViewButtonPressed,
    required this.onDeleteButtonPressed,
    required this.usermodelList,
  });

  void _sort<T> (Comparable<T> Function(UserStory d) getField,bool ascending){
    usermodelList.sort((UserStory a, UserStory b) {
      if (!ascending) {
        final UserStory c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final data = usermodelList[index];

    // String cDate = DateFormat("dd-MM-yyyy").format(data.createdAt);
    bool isActive = false;
    if(data.status == "1"){
      isActive = true;
    } else {
      isActive = false;
    }

    Uint8List bytes = base64.decode(data.photo);
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index+1).toString())),
      DataCell(Padding(
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: data.photo.isEmpty ? Image.asset("assets/images/login_icon.png").image : Image.memory(bytes,fit: BoxFit.cover,height: 60,width: 60,).image,
          radius: 60.0,
        ),
      )),
      DataCell(Text(data.storyTime+" Hours")),
      // DataCell(Text(data.type)),
      DataCell(Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: isActive,
                onChanged: (value){
                  if(value){
                    onDeleteButtonPressed(data.id.toString(),"1");
                  } else {
                    onDeleteButtonPressed(data.id.toString(),"0");
                  }
                },
                activeColor: kPrimaryColor,
              )
            ],
          );
        },
      )),
    ],color: index % 2 == 0 ? MaterialStatePropertyAll(Colors.white) : MaterialStatePropertyAll(Colors.grey.shade200));
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usermodelList.length;

  @override
  int get selectedRowCount => 0;
}

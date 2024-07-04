import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uttam_toys/Model/requirement_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_button_theme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

class RequirementScreen extends StatefulWidget {

  dynamic userId;

  RequirementScreen({super.key,required this.userId});

  @override
  State<RequirementScreen> createState() => _RequirementScreenState();
}

class _RequirementScreenState extends State<RequirementScreen> {

  late UserDataModel _userDataModel;
  late LetterUserDataModel _letterUserDataModel;
  List<Requirement> usermodelList = <Requirement>[];
  List<Requirement> usermodelListLetter = <Requirement>[];
  List<Requirement> filterList2 = <Requirement>[];
  List<Requirement> filterList = <Requirement>[];
  bool _isLoading = false;
  int _totalPageCount = 1;
  int totalRequirement = 0;
  late int rangeEnd,rangeStart;
  var selectedPageNumber = 1;
  late int currentPage;
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();
  bool _sortAscending = true;
  int _sortColumnIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
    fetchUserLetter();
  }

  void _sort<T>(Comparable<T> Function(Requirement d) getField, int columnIndex, bool ascending) {
    _userDataModel._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
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
                      lang.providers(1),
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
                        title: lang.providers(1),
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
                                      SizedBox(
                                        width: 300.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: kDefaultPadding * 1.5),
                                          child: FormBuilderTextField(
                                            name: 'search',
                                            onChanged: (value){
                                              setState(() {
                                                // filterList.clear();
                                                filterList = usermodelList.where(
                                                        (area) => area.title.toLowerCase().contains(value!)).toList();

                                                _userDataModel = UserDataModel(
                                                  onViewButtonPressed: (data){

                                                  },
                                                  usermodelList: filterList,
                                                  onDeleteButtonPressed: (Requirement data) {
                                                    // openDeleteDialouge(data);
                                                  },
                                                );

                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: lang.search,
                                              hintText: lang.search,
                                              border: const OutlineInputBorder(),
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text.rich(
                                          TextSpan(
                                              text: 'Total Requirement Complated:  ',
                                              style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                    style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                                    text: totalRequirement.toString()
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                      // Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(right: kDefaultPadding),
                                      //       child: SizedBox(
                                      //         height: 40.0,
                                      //         child: ElevatedButton(
                                      //           style: themeData.extension<AppButtonTheme>()!.infoElevated,
                                      //           onPressed: () {},
                                      //           child: Row(
                                      //             mainAxisSize: MainAxisSize.min,
                                      //             crossAxisAlignment: CrossAxisAlignment.start,
                                      //             children: [
                                      //               Padding(
                                      //                 padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                                      //                 child: Icon(
                                      //                   Icons.search,
                                      //                   size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                                      //                 ),
                                      //               ),
                                      //               Text(lang.search),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     // SizedBox(
                                      //     //   height: 40.0,
                                      //     //   child: ElevatedButton(
                                      //     //     style: themeData.extension<AppButtonTheme>()!.errorElevated,
                                      //     //     onPressed: () {
                                      //     //     },
                                      //     //     child: Row(
                                      //     //       mainAxisSize: MainAxisSize.min,
                                      //     //       crossAxisAlignment: CrossAxisAlignment.end,
                                      //     //       children: [
                                      //     //         Padding(
                                      //     //           padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                                      //     //           child: Icon(
                                      //     //             Icons.delete,
                                      //     //             size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                                      //     //           ),
                                      //     //         ),
                                      //     //         Text("Delete All"),
                                      //     //       ],
                                      //     //     ),
                                      //     //   ),
                                      //     // ),
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
                                              DataColumn(label: Text('Title'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Requirement d) => d.title, columnIndex, ascending)),
                                              DataColumn(label: Text('Description'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Requirement d) => d.description, columnIndex, ascending)),
                                              DataColumn(label: Text('Created Date'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Requirement d) => d.createdAt.toString(), columnIndex, ascending)),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardHeader(
                        title: lang.letterRequirement(1),
                      ),
                      CardBody(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
                              child: FormBuilder(
                                key: _formKey2,
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
                                      SizedBox(
                                        width: 300.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: kDefaultPadding * 1.5),
                                          child: FormBuilderTextField(
                                            name: 'search',
                                            onChanged: (value){
                                              setState(() {
                                                // filterList.clear();
                                                filterList2 = usermodelListLetter.where(
                                                        (area) => area.title.toLowerCase().contains(value!)).toList();

                                                _letterUserDataModel = LetterUserDataModel(
                                                  onViewButtonPressed: (data){

                                                  },
                                                  usermodelListLetter: filterList2,
                                                  onDeleteButtonPressed: (Requirement data) {
                                                    // openDeleteDialouge(data);
                                                  },
                                                );

                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: lang.search,
                                              hintText: lang.search,
                                              border: const OutlineInputBorder(),
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(right: kDefaultPadding),
                                      //       child: SizedBox(
                                      //         height: 40.0,
                                      //         child: ElevatedButton(
                                      //           style: themeData.extension<AppButtonTheme>()!.infoElevated,
                                      //           onPressed: () {},
                                      //           child: Row(
                                      //             mainAxisSize: MainAxisSize.min,
                                      //             crossAxisAlignment: CrossAxisAlignment.start,
                                      //             children: [
                                      //               Padding(
                                      //                 padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                                      //                 child: Icon(
                                      //                   Icons.search,
                                      //                   size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                                      //                 ),
                                      //               ),
                                      //               Text(lang.search),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     // SizedBox(
                                      //     //   height: 40.0,
                                      //     //   child: ElevatedButton(
                                      //     //     style: themeData.extension<AppButtonTheme>()!.errorElevated,
                                      //     //     onPressed: () {
                                      //     //     },
                                      //     //     child: Row(
                                      //     //       mainAxisSize: MainAxisSize.min,
                                      //     //       crossAxisAlignment: CrossAxisAlignment.end,
                                      //     //       children: [
                                      //     //         Padding(
                                      //     //           padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                                      //     //           child: Icon(
                                      //     //             Icons.delete,
                                      //     //             size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                                      //     //           ),
                                      //     //         ),
                                      //     //         Text("Delete All"),
                                      //     //       ],
                                      //     //     ),
                                      //     //   ),
                                      //     // ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            filterList2.isNotEmpty ? SizedBox(
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
                                            source: _letterUserDataModel,
                                            rowsPerPage: filterList2.length > 20 ? 20 : filterList2.length,
                                            showCheckboxColumn: false,
                                            showFirstLastButtons: true,
                                            sortColumnIndex: _sortColumnIndex,
                                            sortAscending: _sortAscending,
                                            dataRowHeight: 80,
                                            columns: [
                                              DataColumn(label: Text('No.'), numeric: true),
                                              DataColumn(label: Text('Title'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Requirement d) =>d.title != null ? d.title! : "", columnIndex, ascending)),
                                              DataColumn(label: Text('Description'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Requirement d) =>d.description != null ? d.description! : "" , columnIndex, ascending)),
                                              DataColumn(label: Text('Created Date'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Requirement d) => d.createdAt.toString(), columnIndex, ascending)),
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

  fetchUser() async {
    usermodelList.clear();
    filterList.clear();
    setState(() {
      _isLoading = true;
    });

    try{
      final RequirementModel responseModel = await ApiManager.FetchRequirementByUser(widget.userId);
      if(responseModel.error == false) {
        setState(() {
          usermodelList = responseModel.requirements;
          filterList = responseModel.requirements ;
          totalRequirement = responseModel.totalRequirements;


          print(usermodelList);

          _userDataModel = UserDataModel(
            onViewButtonPressed: (data){
              // updatedDialouge(data);
            },
            usermodelList: filterList,

            onDeleteButtonPressed: (Requirement data) {
              // openDeleteDialouge(data);
            },
          );
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

  fetchUserLetter() async {
    usermodelListLetter.clear();
    filterList2.clear();
    setState(() {
      _isLoading = true;
    });

    try{
      final RequirementModel responseModel = await ApiManager.FetchRequirementByUserLetter(widget.userId);
      if(responseModel.error == false) {
        setState(() {
          usermodelListLetter = responseModel.requirements;
          filterList2 = responseModel.requirements;

          _letterUserDataModel = LetterUserDataModel(
            onViewButtonPressed: (data){
              // updatedDialouge(data);
            },
            usermodelListLetter: filterList2,
            onDeleteButtonPressed: (Requirement data) {
              // openDeleteDialouge(data);
            },
          );
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

  openDeleteDialouge(Requirement userModel) async{
    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();

    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.delete_rounded,color: kErrorColor,),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close_rounded,color: kPrimaryColor,)
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Delete User",
                    style: GoogleFonts.inter(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: kTextColor
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Are you sure to delete this user from the system?",
                    style: GoogleFonts.inter(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: kTextColor
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 40.0,
                          child: ElevatedButton(
                            style: Theme.of(context).extension<AppButtonTheme>()!.infoElevated,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 40.0,
                          child: ElevatedButton(
                            style: Theme.of(context).extension<AppButtonTheme>()!.errorElevated,
                            onPressed: () {
                              // DeleteUser(userModel);
                              Navigator.of(context).pop();
                            },
                            child: Text("Delete",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        )
    );
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
}

class UserDataModel extends DataTableSource {
  final void Function(Map<String, dynamic> data) onViewButtonPressed;
  final void Function(Requirement data) onDeleteButtonPressed;
  final List<Requirement> usermodelList;


  UserDataModel({
    required this.onViewButtonPressed,
    required this.onDeleteButtonPressed,
    required this.usermodelList,
  });

  void _sort<T> (Comparable<T> Function(Requirement d) getField,bool ascending){
    usermodelList.sort((Requirement a, Requirement b) {
      if (!ascending) {
        final Requirement c = a;
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

    String cDate = DateFormat("dd-MM-yyyy").format(data.createdAt);

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index+1).toString())),
      DataCell(Text(data.title)),
      DataCell(Text(data.description)),
      DataCell(Text(cDate)),
      DataCell(Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: OutlinedButton(
                  onPressed: () {
                    context.goNamed(
                      "requirementdetails",
                      pathParameters: {"userId": data.id.toString()},
                    );
                  },
                  style: Theme.of(context).extension<AppButtonTheme>()!.infoOutlined,
                  child: Text("View"),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  // onDeleteButtonPressed(usermodelList.elementAt(index));
                },
                // FirebaseFirestore.instance.collection("users").doc(data.uId).delete().then((value){
                //   // setState(() {
                //   //   _isLoading = false;
                //   // });
                //   // getAllUsers();
                //   usermodelList.remove(data);
                // }).onError((error, stackTrace){
                //   // setState(() {
                //   //   _isLoading = false;
                //   // });
                // });
                // },
                style: Theme.of(context).extension<AppButtonTheme>()!.errorOutlined,
                child: Text(Lang.of(context).crudDelete),
              ),
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

class LetterUserDataModel extends DataTableSource {
  final void Function(Map<String, dynamic> data) onViewButtonPressed;
  final void Function(Requirement data) onDeleteButtonPressed;
  final List<Requirement> usermodelListLetter;

  LetterUserDataModel({
    required this.onViewButtonPressed,
    required this.onDeleteButtonPressed,
    required this.usermodelListLetter,
  });

  void _sort<T> (Comparable<T> Function(Requirement d) getField,bool ascending){
    usermodelListLetter.sort((Requirement a, Requirement b) {
      if (!ascending) {
        final Requirement c = a;
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
    final data = usermodelListLetter[index];

    String cDate = DateFormat("dd-MM-yyyy").format(data.createdAt);

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index+1).toString())),
      DataCell(Text(data.title != null ? data.title! : "")),
      DataCell(Text(data.description != null ? data.description! : "")),
      DataCell(Text(cDate != null ? cDate! : "")),
      DataCell(Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: OutlinedButton(
                  onPressed: () {
                    context.goNamed(
                      "requirementdetails",
                      pathParameters: {"userId": data.id.toString()},
                    );
                  },
                  style: Theme.of(context).extension<AppButtonTheme>()!.infoOutlined,
                  child: Text("View"),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  // onDeleteButtonPressed(usermodelList.elementAt(index));
                },
                // FirebaseFirestore.instance.collection("users").doc(data.uId).delete().then((value){
                //   // setState(() {
                //   //   _isLoading = false;
                //   // });
                //   // getAllUsers();
                //   usermodelList.remove(data);
                // }).onError((error, stackTrace){
                //   // setState(() {
                //   //   _isLoading = false;
                //   // });
                // });
                // },
                style: Theme.of(context).extension<AppButtonTheme>()!.errorOutlined,
                child: Text(Lang.of(context).crudDelete),
              ),
            ],
          );
        },
      )),
    ],color: index % 2 == 0 ? MaterialStatePropertyAll(Colors.white) : MaterialStatePropertyAll(Colors.grey.shade200));
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usermodelListLetter.length;


  @override
  int get selectedRowCount => 0;
}

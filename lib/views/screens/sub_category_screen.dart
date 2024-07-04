import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uttam_toys/Model/get_all_category.dart';
import 'package:uttam_toys/Model/result_model.dart';
import 'package:uttam_toys/Model/user_model.dart';
import 'package:uttam_toys/Model/users_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_button_theme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

import '../../Model/get_sub_category_model.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {

  late UserDataModel _userDataModel;
  List<Subcategory> usermodelList = <Subcategory>[];
  List<Subcategory> filterList = <Subcategory>[];
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

  void _sort<T>(Comparable<T> Function(Subcategory d) getField, int columnIndex, bool ascending) {
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
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      lang.subCategory(1),
                      style: themeData.textTheme.headlineMedium,
                    ),
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // button's shape
                        ),
                      ),
                      onPressed: () {
                        context.goNamed(
                          "addSubCatgeoryScreen",
                        );
                      },
                      child: Padding(
                          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                          child: Text("Add Sub Category",style: GoogleFonts.inter(fontSize: 14.0,fontWeight: FontWeight.w800,color: Colors.white),)))
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
                        title: lang.subCategory(1),
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
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.only(right: kDefaultPadding * 1.5,),
                                              child: FormBuilderTextField(
                                                name: 'search',
                                                onChanged: (value){
                                                  setState(() {
                                                    // filterList.clear();
                                                    filterList = usermodelList.where(
                                                            (area) => area.name.toLowerCase().contains(value!)).toList();

                                                    _userDataModel = UserDataModel(
                                                      onViewButtonPressed: (data){

                                                      },
                                                      usermodelList: filterList,
                                                      onDeleteButtonPressed: (Subcategory data) {
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
                                        ],
                                      ),
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
                                              DataColumn(label: Text('Category Name'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Subcategory d) => d.categoryName, columnIndex, ascending)),
                                              DataColumn(label: Text('Sub Category Name'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((Subcategory d) => d.name, columnIndex, ascending)),
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
    setState(() {
      _isLoading = true;
    });

    try{
      final SubCategoriesModel responseModel = await ApiManager.FetchSubCategoryApi();
      if(responseModel.error == false) {
        setState(() {
          usermodelList = responseModel.subcategories;

          filterList = responseModel.subcategories;

          _userDataModel = UserDataModel(
            onViewButtonPressed: (data){
              // updatedDialouge(data);
            },
            usermodelList: filterList,
            onDeleteButtonPressed: (Subcategory data) {
              // openDeleteDialouge(data);
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
//
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
  final void Function(Subcategory data) onDeleteButtonPressed;
  final List<Subcategory> usermodelList;

  UserDataModel({
    required this.onViewButtonPressed,
    required this.onDeleteButtonPressed,
    required this.usermodelList,
  });

  void _sort<T> (Comparable<T> Function(Subcategory d) getField,bool ascending){
    usermodelList.sort((Subcategory a, Subcategory b) {
      if (!ascending) {
        final Subcategory c = a;
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


    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index+1).toString())),
      DataCell(Text(data.categoryName)),
      DataCell(Text(data.name)),
      DataCell(Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: OutlinedButton(
                  onPressed: () {
                    onDeleteButtonPressed(data);
                    // context.goNamed(
                    //   "userRequirement",
                    //   pathParameters: {"userId": data.id.toString()},
                    // );

                  },
                  style: Theme.of(context).extension<AppButtonTheme>()!.errorOutlined,
                  child: Text("Delete"),
                ),
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

import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:uttam_toys/Model/view_product_service.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_button_theme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

class ViewProductService extends StatefulWidget {

  String? userId;

   ViewProductService({super.key, required this.userId});

  @override
  State<ViewProductService> createState() => _ViewProductServiceState();
}

class _ViewProductServiceState extends State<ViewProductService> {

  late UserDataModel _userDataModel;
  List<AllProduct> usermodelList = <AllProduct>[];
  List<AllProduct> filterList = <AllProduct>[];
  bool _isLoading = false;
  int _totalPageCount = 1;
  int totalRequirement = 0;
  late int rangeEnd,rangeStart;
  var selectedPageNumber = 1;
  late int currentPage;
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _sortAscending = true;
  int _sortColumnIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  void _sort<T>(Comparable<T> Function(AllProduct d) getField, int columnIndex, bool ascending) {
    _userDataModel._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
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

  fetchUser() async {
    usermodelList.clear();
    filterList.clear();
    setState(() {
      _isLoading = true;
    });

    try{
      final ViewProductServiceModel responseModel = await ApiManager.FetchProductServiceByUser(widget.userId);
      if(responseModel.error == false) {
        setState(() {
          usermodelList = responseModel.allProducts;
          filterList = responseModel.allProducts ;


          print(usermodelList);

          _userDataModel = UserDataModel(
            onViewButtonPressed: (data){
              // updatedDialouge(data);
            },
            usermodelList: filterList,

            onDeleteButtonPressed: (AllProduct data) {
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
                                                  onDeleteButtonPressed: (AllProduct data) {
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
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((AllProduct d) => d.title, columnIndex, ascending)),
                                              DataColumn(label: Text('Description'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((AllProduct d) => d.description, columnIndex, ascending)),
                                              DataColumn(label: Text('Created Date'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((AllProduct d) => d.createdAt.toString(), columnIndex, ascending)),
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
}


class UserDataModel extends DataTableSource {
  final void Function(Map<String, dynamic> data) onViewButtonPressed;
  final void Function(AllProduct data) onDeleteButtonPressed;
  final List<AllProduct> usermodelList;


  UserDataModel({
    required this.onViewButtonPressed,
    required this.onDeleteButtonPressed,
    required this.usermodelList,
  });

  void _sort<T> (Comparable<T> Function(AllProduct d) getField,bool ascending){
    usermodelList.sort((AllProduct a, AllProduct b) {
      if (!ascending) {
        final AllProduct c = a;
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
              // Padding(
              //   padding: const EdgeInsets.only(right: kDefaultPadding),
              //   child: OutlinedButton(
              //     onPressed: () {
              //       // context.goNamed(
              //       //   "requirementdetails",
              //       //   pathParameters: {"userId": data.id.toString()},
              //       // );
              //     },
              //     style: Theme.of(context).extension<AppButtonTheme>()!.infoOutlined,
              //     child: Text("View"),
              //   ),
              // ),
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

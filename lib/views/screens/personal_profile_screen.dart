import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/theme/theme_extensions/app_button_theme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_color_scheme.dart';
import 'package:uttam_toys/theme/theme_extensions/app_data_table_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';

import '../../Model/user_model.dart';
import '../../Model/users_model.dart';
import '../../utils/api_manager.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {


  late UserDataModel _userDataModel;
  List<User> usermodelList = <User>[];
  List<User> filterList = <User>[];
  bool _isLoading = false;
  int _totalPageCount = 1;
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

  void _sort<T>(Comparable<T> Function(User d) getField, int columnIndex, bool ascending) {
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
                      lang.personalprofile(1),
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
                        title: lang.personalprofile(1),
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
                                                        (area) => area.name.toLowerCase().contains(value!) || area.mobileNumber.toLowerCase().contains(value) || area.type.toLowerCase().contains(value)).toList();

                                                _userDataModel = UserDataModel(
                                                  onViewButtonPressed: (data){

                                                  },
                                                  usermodelList: filterList,
                                                  onDeleteButtonPressed: (User data) {
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
                                              DataColumn(label: Text('Name'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((User d) => d.name, columnIndex, ascending)),
                                              DataColumn(label: Text('Mobile Number'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((User d) => d.mobileNumber, columnIndex, ascending)),
                                              DataColumn(label: Text('Batch Year'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((User d) => d.batchYear, columnIndex, ascending)),
                                              DataColumn(label: Text('Type'),
                                                  onSort: (int columnIndex, bool ascending) => _sort<String>((User d) => d.type, columnIndex, ascending)),
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
      final UserModel responseModel = await ApiManager.FetchUserApiPersonal();
      if(responseModel.error == false) {
        setState(() {
          usermodelList = responseModel.users;
          filterList = responseModel.users;

          _userDataModel = UserDataModel(
            onViewButtonPressed: (data){
              // updatedDialouge(data);
            },
            usermodelList: filterList,
            onDeleteButtonPressed: (User data) {
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

  // Future<void> fetchUser() async {
  //   usermodelList.clear();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try{
  //     final UserModel responseModel = await ApiManager.FetchUserApi();
  //     if(responseModel.error == false) {
  //       setState(() {
  //         usermodelList = responseModel.allCustomer;
  //         filterList = responseModel.allCustomer;
  //
  //         _userDataModel = UserDataModel(
  //           onViewButtonPressed: (data){
  //             // updatedDialouge(data);
  //           },
  //           usermodelList: filterList,
  //           onDeleteButtonPressed: (AllCustomer data) {
  //             openDeleteDialouge(data);
  //           },
  //         );
  //         _isLoading = false;
  //       });
  //
  //     } else{
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       _onLoginError(context, responseModel.message);
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

  openDeleteDialouge(User userModel) async{
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

  // deleteUser(UsersModel areasModel) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   final _storage = FirebaseStorage.instanceFor(
  //       bucket: 'gs://superbbus-ff6b0.appspot.com/user');
  //
  //   var photo =  _storage.refFromURL(areasModel.uImage!);
  //   await photo.delete();
  //
  //   FirebaseFirestore.instance.collection("users").doc(areasModel.uId).delete().then((value){
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     fetchUser();
  //
  //   }).onError((error, stackTrace){
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  // Future<void> DeleteUser(User userModel) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try{
  //     final ResultModel responseModel = await ApiManager.DeleteUserApi(userModel.id.toString());
  //     if(responseModel.error == false) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       _onSuccess(context, responseModel.message);
  //       fetchUser();
  //     } else{
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       _onLoginError(context, responseModel.message);
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
  final void Function(User data) onDeleteButtonPressed;
  final List<User> usermodelList;

  UserDataModel({
    required this.onViewButtonPressed,
    required this.onDeleteButtonPressed,
    required this.usermodelList,
  });

  void _sort<T> (Comparable<T> Function(User d) getField,bool ascending){
    usermodelList.sort((User a, User b) {
      if (!ascending) {
        final User c = a;
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

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index+1).toString())),
      DataCell(Text(data.name)),
      DataCell(Text(data.mobileNumber)),
      DataCell(Text(data.batchYear)),
      DataCell(Text(data.type)),
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
                      "userRequirement",
                      pathParameters: {"userId": data.id.toString()},
                    );
                  },
                  style: Theme.of(context).extension<AppButtonTheme>()!.infoOutlined,
                  child: Text("View Requirement"),
                ),
              ),
              // OutlinedButton(
              //   onPressed: () {
              //     // onDeleteButtonPressed(usermodelList.elementAt(index));
              //   },
              //   // FirebaseFirestore.instance.collection("users").doc(data.uId).delete().then((value){
              //   //   // setState(() {
              //   //   //   _isLoading = false;
              //   //   // });
              //   //   // getAllUsers();
              //   //   usermodelList.remove(data);
              //   // }).onError((error, stackTrace){
              //   //   // setState(() {
              //   //   //   _isLoading = false;
              //   //   // });
              //   // });
              //   // },
              //   style: Theme.of(context).extension<AppButtonTheme>()!.errorOutlined,
              //   child: Text(Lang.of(context).crudDelete),
              // ),
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: OutlinedButton(
                  onPressed: () {
                    context.goNamed(
                      "userProfile",
                      pathParameters: {"userId": data.id.toString()},
                    );
                  },
                  style: Theme.of(context).extension<AppButtonTheme>()!.infoOutlined,
                  child: Text(
                      data.type == null
                          ? "null"
                          : "View Profile"
                  ),

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
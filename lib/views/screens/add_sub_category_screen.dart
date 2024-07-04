import 'dart:convert';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_asset_picker/form_builder_asset_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uttam_toys/Model/category_model.dart';
import 'package:uttam_toys/Model/get_all_category.dart';
import 'package:uttam_toys/Model/result_model.dart';
import 'package:uttam_toys/constants/dimens.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/providers/user_data_provider.dart';
import 'package:uttam_toys/theme/theme_extensions/app_button_theme.dart';
import 'package:uttam_toys/theme/themes.dart';
import 'package:uttam_toys/utils/api_manager.dart';
import 'package:uttam_toys/views/widgets/card_elements.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';


class AddSubCatgeoryScreen extends StatefulWidget {
  AddSubCatgeoryScreen({super.key});

  @override
  State<AddSubCatgeoryScreen> createState() => _AddSubCatgeoryScreenState();
}

class _AddSubCatgeoryScreenState extends State<AddSubCatgeoryScreen> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController _dnameController = TextEditingController();
  String? dname,adminid;
  String? imageUrl,imageName,img64;
  Uint8List? bytesFromPicker = null;
  List<Category> usermodelList = <Category>[];
  Category? selectedCategory;
  String selectedCategoryName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataAsync();
    fetchUser();
  }

  _getDataAsync() async {
    final userDataProvider = context.read<UserDataProvider>();
    setState(() {
      adminid = userDataProvider.userid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);

    return PortalMasterLayout(
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
      ) : ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            lang.subCategory(1),
            style: themeData.textTheme.headlineMedium,
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
                    child: FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField<Category>(
                                    decoration: const InputDecoration(
                                      labelText: 'Category Name',
                                      hintText: 'Category Name',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    value: selectedCategory,
                                    onChanged: (Category? newValue) {
                                      setState(() {
                                        selectedCategory = newValue!;
                                        selectedCategoryName = newValue.name; // Store the selected category name
                                      });
                                      print(selectedCategoryName);
                                      print("objectobjectobject");
                                    },
                                    items: usermodelList.map((Category category) {
                                      return DropdownMenuItem<Category>(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a Category';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FormBuilderTextField(
                                    name: 'Category Name',
                                    controller: _dnameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Category Name',
                                      hintText: 'Category Name',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter Category Name"),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                            child: FormBuilderAssetPicker(
                              name: 'file_picker',
                              allowedExtensions: const ['jpg', 'png'],
                              allowMultiple: false,
                              maxFiles: 1,
                              type: FileType.custom,
                              decoration: const InputDecoration(
                                  labelText: 'Area Image',
                                  border: OutlineInputBorder(),
                                  counterText: ""
                              ),
                              withData: true,
                              selector: const Row(
                                children: [
                                  Icon(Icons.file_upload),
                                  Text('Upload'),
                                ],
                              ),
                              onChanged: (value){
                                setState(() {
                                  imageName = value!.first.name;
                                  bytesFromPicker = value.first.bytes;
                                  img64 = base64Encode(bytesFromPicker!);
                                });
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 40.0,
                                  child: ElevatedButton(
                                    style: themeData.extension<AppButtonTheme>()!.primaryOutlined,
                                    onPressed: () {
                                      // GoRouter.of(context).go(RouteUri.drivers);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                                          child: Icon(
                                            Icons.close_rounded,
                                            size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        Text("close",style: themeData.textTheme.titleMedium!.copyWith(color: kPrimaryColor),),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                SizedBox(
                                  height: 40.0,
                                  child: ElevatedButton(
                                    style: themeData.extension<AppButtonTheme>()!.successElevated,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        dname = _dnameController.text.trim();

                                        if(bytesFromPicker == null){
                                          _onLoginError(context, "Please select Image");
                                        } else {
                                          addCategory();
                                        }
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                                          child: Icon(
                                            Icons.save_rounded,
                                            size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(lang.save,style: themeData.textTheme.titleMedium!.copyWith(color: Colors.white),),
                                      ],
                                    ),
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
        ],
      ),
    );
  }


  void addCategory() async{
    setState(() {
      _isLoading = true;
    });
    try {
      final ResultModel resultModel = await ApiManager.AddSubCategory(
          selectedCategoryName,
        _dnameController.text.trim(),
        img64!,
      );

      if (!resultModel.error) {
        setState(() {
          _isLoading = false;
          _dnameController.text = "";
          imageName = "";
          img64 = "";
          bytesFromPicker = null;
        });
        _onSuccess(context, resultModel.message);
      } else {
        setState(() {
          _isLoading = false;
        });
        _onLoginError(context, resultModel.message);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _onLoginError(context, e.toString());
    }
  }


  fetchUser() async {
    setState(() {
      _isLoading = true;
    });

    try{
      final GetCategory responseModel = await ApiManager.FetchCategoryApi();
      if(responseModel.error == false) {
        setState(() {
          usermodelList = responseModel.categories;

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
      btnOkOnPress: () {
        // GoRouter.of(context).go(RouteUri.drivers);
      },
    );

    dialog.show();
  }
}

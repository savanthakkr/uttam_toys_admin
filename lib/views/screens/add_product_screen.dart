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

import '../../Model/get_sub_category_model.dart';
import '../../app_router.dart';
import '../../utils/connection_utils.dart';
import 'dart:html' as html;
import 'dart:io' as Io;

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController _dnameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _subCategoryController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  TextEditingController _descriptionshortController = TextEditingController();
  TextEditingController _descriptionlongController = TextEditingController();
  TextEditingController _mainpriceController = TextEditingController();
  TextEditingController _discountpriceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _skuController = TextEditingController();
  TextEditingController _taxvalueController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  Subcategory? selectedSubCategory;
  Category? selectedCategory;
  String selectedCategoryName = "";
  String selectedSubCategoryName = "";
  String? dname,adminid;
  String? imageUrl,imageName,img64;
  Uint8List? bytesFromPicker = null;
  List<String> imagebytes = <String>[];
  List<Category> usermodelList = <Category>[];
  List<Subcategory> usermodeSubCategorylList = <Subcategory>[];
  List<Uint8List> imageBytes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataAsync();
    fetchCategory();
    fetchSubCtegory();
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
            lang.addProduct,
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
                    title: lang.addProduct,
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
                                  child: FormBuilderTextField(
                                    name: 'Product Name',
                                    controller: _dnameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Product Name',
                                      hintText: 'Product Name',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter Product Name"),
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
                                  child: DropdownButtonFormField<Subcategory>(
                                    decoration: const InputDecoration(
                                      labelText: 'Sub Category Name',
                                      hintText: 'Sub Category Name',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    value: selectedSubCategory,
                                    onChanged: (Subcategory? newValue) {
                                      setState(() {
                                        selectedSubCategory = newValue!;
                                        selectedSubCategoryName = newValue.name; // Store the selected category name
                                      });
                                      print(selectedSubCategoryName);
                                      print("objectobjectobject");
                                    },
                                    items: usermodeSubCategorylList.map((Subcategory category) {
                                      return DropdownMenuItem<Subcategory>(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a Sub Category';
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
                                    name: 'brand id',
                                    controller: _brandController,
                                    decoration: const InputDecoration(
                                      labelText: ' brand id ',
                                      hintText: ' brand id ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter brand id "),
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
                                    name: 'description short',
                                    controller: _descriptionshortController,
                                    decoration: const InputDecoration(
                                      labelText: ' description short',
                                      hintText: ' description short ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter description short "),
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
                                    name: 'description long',
                                    controller: _descriptionlongController,
                                    decoration: const InputDecoration(
                                      labelText: ' description long ',
                                      hintText: ' description long ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter description long "),
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
                                    name: 'Main price',
                                    controller: _mainpriceController,
                                    decoration: const InputDecoration(
                                      labelText: ' Main price ',
                                      hintText: ' Main price ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter Main price "),
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
                                    name: 'discount price',
                                    controller: _discountpriceController,
                                    decoration: const InputDecoration(
                                      labelText: ' discount price ',
                                      hintText: ' discount price ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter discount price "),
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
                                    name: 'quantity ',
                                    controller: _quantityController,
                                    decoration: const InputDecoration(
                                      labelText: ' quantity  ',
                                      hintText: ' quantity  ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter quantity  "),
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
                                    name: 'sku ',
                                    controller: _skuController,
                                    decoration: const InputDecoration(
                                      labelText: ' sku  ',
                                      hintText: ' sku  ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter sku  "),
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
                                    name: 'tax value ',
                                    controller: _taxvalueController,
                                    decoration: const InputDecoration(
                                      labelText: ' tax value   ',
                                      hintText: ' tax value   ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter tax value   "),
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
                                    name: 'tags  ',
                                    controller: _tagsController,
                                    decoration: const InputDecoration(
                                      labelText: ' tags    ',
                                      hintText: ' tags    ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter tags    "),
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
                                    name: 'age  ',
                                    controller: _ageController,
                                    decoration: const InputDecoration(
                                      labelText: ' age    ',
                                      hintText: ' age    ',
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    onSaved: (value1) => (_dnameController.text = value1 ?? ''),
                                    validator: FormBuilderValidators.required(errorText: "Please enter age    "),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0), // Replace kDefaultPadding if not defined
                            child: FormBuilderAssetPicker(
                              name: 'file_picker',
                              allowedExtensions: const ['jpg', 'png'],
                              allowMultiple: true,
                              maxFiles: 5,
                              type: FileType.custom,
                              decoration: const InputDecoration(
                                labelText: 'Area Image',
                                border: OutlineInputBorder(),
                                counterText: "",
                              ),
                              withData: true,
                              selector: const Row(
                                children: [
                                  Icon(Icons.file_upload),
                                  Text('Upload'),
                                ],
                              ),
                              onChanged: (value) async {
                                imagebytes.clear(); // Clear previous selections
                                if (value != null) {
                                  for (var platformFile in value) {
                                    if (platformFile.bytes != null) {
                                      setState(() {
                                        // imageBytes.add(platformFile.bytes!);
                                        imagebytes.add(base64Encode(platformFile.bytes!));
                                      });
                                    } else {
                                      print("File bytes are null for ${platformFile.name}");
                                    }
                                  }
                                }
                                for (var bytes in imagebytes) {
                                  print(bytes);
                                }
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

                                        if(imagebytes.isEmpty){
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


  fetchSubCtegory() async {
    setState(() {
      _isLoading = true;
    });

    try{
      final SubCategoriesModel responseModel = await ApiManager.FetchSubCategoryApi();
      if(responseModel.error == false) {
        setState(() {
          usermodeSubCategorylList = responseModel.subcategories;

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

  fetchCategory() async {
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


  void addCategory() async{
    setState(() {
      _isLoading = true;
    });
    try {
      final ResultModel resultModel = await ApiManager.AddProduct(
        _dnameController.text.trim(),
        selectedCategoryName,
        selectedSubCategoryName,
          _brandController.text.trim(),
          _descriptionshortController.text.trim(),
          _descriptionlongController.text.trim(),
          _mainpriceController.text.trim(),
          _discountpriceController.text.trim(),
          _quantityController.text.trim(),
          _skuController.text.trim(),
          _taxvalueController.text.trim(),
          _tagsController.text.trim(),
          _ageController.text.trim(),
        imagebytes!,
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

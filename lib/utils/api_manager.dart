import 'dart:convert';

import 'package:uttam_toys/Model/admin_model.dart';
import 'package:uttam_toys/Model/age_model.dart';
import 'package:uttam_toys/Model/area_model.dart';
import 'package:uttam_toys/Model/brand_model.dart';
import 'package:uttam_toys/Model/company_profile_model.dart';
import 'package:uttam_toys/Model/current_order_model.dart';
import 'package:uttam_toys/Model/details_requirement_model.dart';
import 'package:uttam_toys/Model/driver_model.dart';
import 'package:uttam_toys/Model/get_all_category.dart';
import 'package:uttam_toys/Model/get_sub_category_model.dart';
import 'package:uttam_toys/Model/log_model.dart';
import 'package:uttam_toys/Model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:uttam_toys/Model/receipt_model.dart';
import 'package:uttam_toys/Model/requirement_model.dart';
import 'package:uttam_toys/Model/result_model.dart';
import 'package:uttam_toys/Model/school_model.dart';
import 'package:uttam_toys/Model/total_count_all.dart';
import 'package:uttam_toys/Model/user_model.dart';
import 'package:uttam_toys/Model/user_profile_model.dart';
import 'package:uttam_toys/Model/user_story_model.dart';
import 'package:uttam_toys/Model/vehicle_profile_model.dart';
import 'package:uttam_toys/Model/view_product_service.dart';
import 'package:uttam_toys/Model/view_profile_model.dart';

class ApiManager {

  static String BASE_URL = "http://192.168.1.4:5000/uttam/users/";
  // static String BASE_URL = "http://3.110.124.116:5000/uttam/users/";

  // static String IMAGE_URL = "https://www.shabakh.com/TransFor/api/uploads/";

  static Future<LoginModel> AdminLoginAPi(String email,String password) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"loginUserAdmin"),
        body: {
          "email" : email,
          "password" : password
        });

    return loginModelFromJson(response.body);
  }

  static Future<ResultModel> AddAdminApi(String name,String its,String mobile,String password) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"AddAdmin"),
        body: {
          "name" : name,
          "itsno" : its,
          "mobile" : mobile,
          "password" : password,
        });

    return resultModelFromJson(response.body);
  }


  static Future<ResultModel> AddCategory(String title, String images) async
  {

    final response = await http.post(Uri.parse("${BASE_URL}createCategory"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'images': images,
        }));

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> AddProduct(String title,String category_id,String sub_category_id,String brand_id,String description_short,String description_long,String main_price,String discount_price,String quantity,String sku,String tax_value, String tags, String age,  String images) async
  {

    final response = await http.post(Uri.parse("${BASE_URL}createProduct"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': title,
          'category_id': category_id,
          'sub_category_id': sub_category_id,
          'brand_id': brand_id,
          'description_short': description_short,
          'description_long': description_long,
          'main_price': main_price,
          'discount_price': discount_price,
          'quantity': quantity,
          'sku': sku,
          'tax_value': tax_value,
          'tags': tags,
          'age': age,
          'images': images,
        }));

    return resultModelFromJson(response.body);
  }


  static Future<ResultModel> AddSubCategory(String category, String title, String images) async
  {

    final response = await http.post(Uri.parse("${BASE_URL}createSubCategory"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'category': category,
          'title': title,
          'images': images,
        }));

    return resultModelFromJson(response.body);
  }

  static Future<GetCategory> FetchCategoryApi() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"getAllCategories"),);

    return getCategoryFromJson(response.body);
  }

  static Future<ResultModel> AddAge(String title) async
  {

    final response = await http.post(Uri.parse("${BASE_URL}createAge"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
        }));

    return resultModelFromJson(response.body);
  }

  static Future<AgeModel> FetchAgeApi() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"getAllAge"),);

    return ageModelFromJson(response.body);
  }

  static Future<ResultModel> AddBrand(String title, String images) async
  {

    final response = await http.post(Uri.parse("${BASE_URL}createBarand"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'images': images,
        }));

    return resultModelFromJson(response.body);
  }

  static Future<BrandModel> FetchBrandApi() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"getAllBrand"),);

    return brandModelFromJson(response.body);
  }

  static Future<SubCategoriesModel> FetchSubCategoryApi() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"fetchSubCategories"),);

    return subCategoriesModelFromJson(response.body);
  }

  static Future<AdminModel> FetchAdminApi() async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchAllAdmin"),
        body: {
          "key" : "KEY"
        });

    return adminModelFromJson(response.body);
  }

  static Future<ResultModel> DeleteAdminApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"DeleteAdmin"),
        body: {
          "id" : id,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> AddUserApi(String name,String its,String sabil,String mobile) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"AddCustomer"),
        body: {
          "name" : name,
          "itsno" : its,
          "sabilno" : sabil,
          "mobile" : mobile
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> UpdateUserApi(String id,String name,String its,String sabil,String mobile) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"UpdateCustomer"),
        body: {
          "id" : id,
          "name" : name,
          "itsno" : its,
          "sabilno" : sabil,
          "mobile" : mobile
        });

    return resultModelFromJson(response.body);
  }

  static Future<UserStoryModel> FetchUserStory(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"getUserStorybyId"),
        body: {
          "userId" : id,
        });

    return userStoryModelFromJson(response.body);
  }

  static Future<ResultModel> VerifyBusinessProfile(String id,String status) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"verifyBusinessProfile"),
        body: {
          "userId" : id,
          "status" : status,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> VerifyStory(String id,String status) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"verifyStory"),
        body: {
          "storyId" : id,
          "status" : status,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> DeleteUserApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"DeleteUser"),
        body: {
          "Id" : id,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> UpdateUserStatusApi(String id,String status) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"UpdateUserStatus"),
        body: {
          "Id" : id,
          "Status": status,
        });

    return resultModelFromJson(response.body);
  }

  static Future<UserModel> FetchUserApi() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"fetchUsersForAdmin"),);

    return userModelFromJson(response.body);
  }

  static Future<TotalCountModel> FetchUserCountAllApi() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"fetchUsersTotalCountAll"),);

    return totalCountModelFromJson(response.body);
  }

  static Future<UserModel> FetchUserApiPersonal() async
  {
    final response = await http.get(Uri.parse(BASE_URL+"fetchUsersForAdminPersonal"),);

    print(response.body);

    return userModelFromJson(response.body);
  }

  static Future<ViewProfileModl> FetchUserApiPersonalProfile(dynamic id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"fetchUserProfile"),
        body: {
          "userId" : id
        });

    print(response.body);
    return viewProfileModlFromJson(response.body);
  }


  static Future<RequirementModel> FetchRequirementByUserLetter(dynamic id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"fetchUserRequirementsLetter"),
        body: {
          "userId" : id
        });



    return requirementModelFromJson(response.body);
  }
  static Future<ViewProductServiceModel> FetchProductServiceByUser(dynamic id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"getAllUserPrductService"),
        body: {
          "userId" : id
        });

    print(response.body);
    return viewProductServiceModelFromJson(response.body);
  }

  static Future<RequirementModel> FetchRequirementByUser(dynamic id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"fetchUserRequirements"),
        body: {
          "userId" : id
        });

    return requirementModelFromJson(response.body);
  }

  static Future<RequirementDetailsModel> FetchRequirementDetails(dynamic id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"fetchRequirementDetails"),
        body: {
          "requirementId" : id
        });


    print(response.body);

    return requirementDetailsModelFromJson(response.body);
  }

  static Future<UserProfileModel> FetchUserByIdApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchUserData"),
        body: {
          "ID" : id
        });

    return userProfileModelFromJson(response.body);
  }

  static Future<UserModel> FetchUserDetailsApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchCustomerbyID"),
        body: {
          "ID" : id,
        });

    return userModelFromJson(response.body);
  }

  static Future<CompanyProfileModel> FetchUserCompanyDetailsApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchUserCompanyData"),
        body: {
          "Uid" : id,
        });

    return companyProfileModelFromJson(response.body);
  }

  static Future<VehicleProfileModel> FetchUserVehicleDetailsApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchUserVehicalData"),
        body: {
          "Uid" : id,
        });

    return vehicleProfileModelFromJson(response.body);
  }

  static Future<CurrentOrderModel> FetchCurrentOrders() async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchAdminOrders"),
        body: {
          "key" : "TRANS",
        });

    return currentOrderModelFromJson(response.body);
  }

  static Future<UserModel> FetchUserDetailsbySabilApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchCustomerbySabil"),
        body: {
          "ID" : id,
        });

    return userModelFromJson(response.body);
  }

  static Future<ResultModel> AddArea(String aname,String lname,String image,String imagename,String amount,String hvalue) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"AddArea"),
        body: {
          "NAME" : aname,
          "LOCATION" : lname,
          "IMAGE" : image,
          "image_name" : imagename,
          "AMOUNT" : amount,
          "HVALUE" : hvalue,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> AddDriverApi(String dname,String mobile,String lnumber,String address) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"AddDriver"),
        body: {
          "Name" : dname,
          "Mobile" : mobile,
          "Lnumber" : lnumber,
          "Address" : address,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> UpdateReceiptApi(String id,String userId,String adminId,String vajebaat,String khair,
      String fmb,String sabil,String other,String total,String mode,String remark,String ashra,String fmbmode,
      String vcno,String vbank,String fmbcno,String fmbbank) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"UpdateReceipt"),
        body: {
          "id": id,
          "user_id" : userId,
          "admin_id" : adminId,
          "vajebaat_amount" : vajebaat,
          "khair_amount" : khair,
          "fmb_amount" : fmb,
          "sabil_amount" : sabil,
          "other_amount" : other,
          "ashra_amount" : ashra,
          "total_amount" : total,
          "payment_mode" : mode,
          "fmb_payment_mode" : fmbmode,
          "remark" : remark,
          "vcno" : vcno,
          "vbank" : vbank,
          "fmbcno" : fmbcno,
          "fmbbank" : fmbbank
        });

    return resultModelFromJson(response.body);
  }

  static Future<AreaModel> FetchAreaApi() async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchArea"),
        body: {
          "key" : "SUPERBBUS"
        });

    return areaModelFromJson(response.body);
  }

  static Future<DriverModel> FetchDriverApi() async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchAllDriver"),
        body: {
          "key" : "KEY"
        });

    return driverModelFromJson(response.body);
  }

  static Future<SchoolModel> FetchSchoolApi() async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchSchool"),
        body: {
          "key" : "SUPERBBUS"
        });

    return schoolModelFromJson(response.body);
  }

  static Future<ReceiptModel> FetchReceiptByIDApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchReceiptByID"),
        body: {
          "ID" : id
        });

    return receiptModelFromJson(response.body);
  }

  static Future<ReceiptModel> FetchReceiptByDATEApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchReceiptByDATE"),
        body: {
          "ID" : id
        });

    return receiptModelFromJson(response.body);
  }

  static Future<ResultModel> AddSchool(String aid,String sname,String image,String imagename,String bus) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"AddSchool"),
        body: {
          "Aid" : aid,
          "NAME" : sname,
          "SIMAGE" : image,
          "image_name" : imagename,
          "ABUS" : bus,
        });

    return resultModelFromJson(response.body);
  }

  static Future<LogsModel> FetchLogsByIDApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"FetchLogsbyID"),
        body: {
          "ID" : id
        });

    return logsModelFromJson(response.body);
  }

  static Future<ResultModel> DeleteAreaApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"DeleteArea"),
        body: {
          "id" : id,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> DeleteSchoolApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"DeleteSchool"),
        body: {
          "id" : id,
        });

    return resultModelFromJson(response.body);
  }

  static Future<ResultModel> DeleteDriverApi(String id) async
  {
    final response = await http.post(Uri.parse(BASE_URL+"DeleteDriver"),
        body: {
          "id" : id,
        });

    return resultModelFromJson(response.body);
  }
}
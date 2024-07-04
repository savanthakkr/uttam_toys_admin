// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(_current != null,
        'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(instance != null,
        'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?');
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Admin Portal Login`
  String get adminPortalLogin {
    return Intl.message(
      'Admin Portal Login',
      name: 'adminPortalLogin',
      desc: '',
      args: [],
    );
  }

  /// `Web Admin`
  String get appTitle {
    return Intl.message(
      'Card Saver',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Button Emphasis`
  String get buttonEmphasis {
    return Intl.message(
      'Button Emphasis',
      name: 'buttonEmphasis',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Button} other{Buttons}}`
  String buttons(num count) {
    return Intl.plural(
      count,
      one: 'Button',
      other: 'Buttons',
      name: 'buttons',
      desc: '',
      args: [count],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Close Navigation Menu`
  String get closeNavigationMenu {
    return Intl.message(
      'Close Navigation Menu',
      name: 'closeNavigationMenu',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Color} other{Colors}}`
  String colors(num count) {
    return Intl.plural(
      count,
      one: 'Color',
      other: 'Colors',
      name: 'colors',
      desc: '',
      args: [count],
    );
  }

  /// `Color Palette`
  String get colorPalette {
    return Intl.message(
      'Color Palette',
      name: 'colorPalette',
      desc: '',
      args: [],
    );
  }

  /// `Color Scheme`
  String get colorScheme {
    return Intl.message(
      'Color Scheme',
      name: 'colorScheme',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delete this record?`
  String get confirmDeleteRecord {
    return Intl.message(
      'Confirm delete this record?',
      name: 'confirmDeleteRecord',
      desc: '',
      args: [],
    );
  }

  /// `Confirm submit this record?`
  String get confirmSubmitRecord {
    return Intl.message(
      'Confirm submit this record?',
      name: 'confirmSubmitRecord',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid credit card number.`
  String get creditCardErrorText {
    return Intl.message(
      'This field requires a valid credit card number.',
      name: 'creditCardErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get crudBack {
    return Intl.message(
      'Back',
      name: 'crudBack',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get crudDelete {
    return Intl.message(
      'Delete',
      name: 'crudDelete',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get crudDetail {
    return Intl.message(
      'Detail',
      name: 'crudDetail',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get crudNew {
    return Intl.message(
      'New',
      name: 'crudNew',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  String get overall {
    return Intl.message(
      'Overall Counts',
      name: 'overall',
      desc: '',
      args: [],
    );
  }

  String get today {
    return Intl.message(
      'Today Counts',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid date string.`
  String get dateStringErrorText {
    return Intl.message(
      'This field requires a valid date string.',
      name: 'dateStringErrorText',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Dialog} other{Dialogs}}`
  String dialogs(num count) {
    return Intl.plural(
      count,
      one: 'Dialog',
      other: 'Dialogs',
      name: 'dialogs',
      desc: '',
      args: [count],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid email address.`
  String get emailErrorText {
    return Intl.message(
      'This field requires a valid email address.',
      name: 'emailErrorText',
      desc: '',
      args: [],
    );
  }

  /// `This field value must be equal to {value}.`
  String equalErrorText(Object value) {
    return Intl.message(
      'This field value must be equal to $value.',
      name: 'equalErrorText',
      desc: '',
      args: [value],
    );
  }

  /// `Error 404`
  String get error404 {
    return Intl.message(
      'Error 404',
      name: 'error404',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, the page you are looking for has been removed or not exists.`
  String get error404Message {
    return Intl.message(
      'Sorry, the page you are looking for has been removed or not exists.',
      name: 'error404Message',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get error404Title {
    return Intl.message(
      'Page not found',
      name: 'error404Title',
      desc: '',
      args: [],
    );
  }

  /// `Example`
  String get example {
    return Intl.message(
      'Example',
      name: 'example',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Extension} other{Extensions}}`
  String extensions(num count) {
    return Intl.plural(
      count,
      one: 'Extension',
      other: 'Extensions',
      name: 'extensions',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{Form} other{Forms}}`
  String forms(num count) {
    return Intl.plural(
      count,
      one: 'Form',
      other: 'Forms',
      name: 'forms',
      desc: '',
      args: [count],
    );
  }

  String category(num count) {
    return Intl.plural(
      count,
      one: 'Category',
      other: 'category',
      name: 'category',
      desc: '',
      args: [count],
    );
  }
  String subCategory(num count) {
    return Intl.plural(
      count,
      one: 'Sub Category',
      other: 'subCategory',
      name: 'subcategory',
      desc: '',
      args: [count],
    );
  }
  String brand(num count) {
    return Intl.plural(
      count,
      one: 'Brand',
      other: 'brand',
      name: 'brand',
      desc: '',
      args: [count],
    );
  }
  String age(num count) {
    return Intl.plural(
      count,
      one: 'Age',
      other: 'age',
      name: 'age',
      desc: '',
      args: [count],
    );
  }

  String userstory(num count) {
    return Intl.plural(
      count,
      one: 'Story',
      other: 'Story',
      name: 'userstory',
      desc: '',
      args: [count],
    );
  }

  String personalprofile(num count) {
    return Intl.plural(
      count,
      one: 'Personal Profile',
      other: 'Personal Profile',
      name: 'personalprofile',
      desc: '',
      args: [count],
    );
  }

  String providers(num count) {
    return Intl.plural(
      count,
      one: 'Requirements',
      other: 'Requirements',
      name: 'requirments',
      desc: '',
      args: [count],
    );
  }
  String letterRequirement(num count) {
    return Intl.plural(
      count,
      one: 'Letter Requirement',
      other: 'Letter Requirement',
      name: 'letterrequirement',
      desc: '',
      args: [count],
    );
  }
  String requirmentdetails(num count) {
    return Intl.plural(
      count,
      one: 'Requirement Details',
      other: 'Requirement Details',
      name: 'requirmentdetails',
      desc: '',
      args: [count],
    );
  }
  String profiledetails(num count) {
    return Intl.plural(
      count,
      one: 'Profile Details',
      other: 'Profile Details',
      name: 'profiledetails',
      desc: '',
      args: [count],
    );
  }

  String drivers(num count) {
    return Intl.plural(
      count,
      one: 'Drivers',
      other: 'Drivers',
      name: 'drivers',
      desc: '',
      args: [count],
    );
  }

  String corders(num count) {
    return Intl.plural(
      count,
      one: 'Current Orders',
      other: 'Current Orders',
      name: 'corders',
      desc: '',
      args: [count],
    );
  }

  String porders(num count) {
    return Intl.plural(
      count,
      one: 'Past Orders',
      other: 'Past Orders',
      name: 'porders',
      desc: '',
      args: [count],
    );
  }

  String areas(num count) {
    return Intl.plural(
      count,
      one: 'Areas',
      other: 'Areas',
      name: 'areas',
      desc: '',
      args: [count],
    );
  }

  String layouts(num count) {
    return Intl.plural(
      count,
      one: 'Bus Layout',
      other: 'Bus Layout',
      name: 'layouts',
      desc: '',
      args: [count],
    );
  }

  String assignBus(num count) {
    return Intl.plural(
      count,
      one: 'Assign Bus',
      other: 'Assign Bus',
      name: 'assignBus',
      desc: '',
      args: [count],
    );
  }

  String requestareas(num count) {
    return Intl.plural(
      count,
      one: 'Requested Area',
      other: 'Requested Area',
      name: 'requestareas',
      desc: '',
      args: [count],
    );
  }

  String requestschool(num count) {
    return Intl.plural(
      count,
      one: 'Requested School',
      other: 'Requested School',
      name: 'requestschool',
      desc: '',
      args: [count],
    );
  }

  String schools(num count) {
    return Intl.plural(
      count,
      one: 'Schools',
      other: 'Schools',
      name: 'Schools',
      desc: '',
      args: [count],
    );
  }

  String greceipt(num count) {
    return Intl.plural(
      count,
      one: 'Generate Blank Receipt',
      other: 'Generate Blank Receipt',
      name: 'Generate Blank Receipt',
      desc: '',
      args: [count],
    );
  }

  String admins(num count) {
    return Intl.plural(
      count,
      one: 'Admins',
      other: 'Admins',
      name: 'Admins',
      desc: '',
      args: [count],
    );
  }

  String viewreceipts(num count) {
    return Intl.plural(
      count,
      one: 'View Receipts',
      other: 'View Receipts',
      name: 'viewreceipts',
      desc: '',
      args: [count],
    );
  }

  String usercards(num count) {
    return Intl.plural(
      count,
      one: 'User Card',
      other: 'User Cards',
      name: 'userCards',
      desc: '',
      args: [count],
    );
  }

  String logs(num count) {
    return Intl.plural(
      count,
      one: 'Logs',
      other: 'Logs',
      name: 'logs',
      desc: '',
      args: [count],
    );
  }

  String usersms(num count) {
    return Intl.plural(
      count,
      one: 'User Sms',
      other: 'User Sms',
      name: 'userSms',
      desc: '',
      args: [count],
    );
  }

  // String category(num count) {
  //   return Intl.plural(
  //     count,
  //     one: 'Receipt',
  //     other: 'Receipt',
  //     name: 'receipt',
  //     desc: '',
  //     args: [count],
  //   );
  // }

  String product(num count) {
    return Intl.plural(
      count,
      one: 'Product',
      other: 'Products',
      name: 'Products',
      desc: '',
      args: [count],
    );
  }

  /// `General UI`
  String get generalUi {
    return Intl.message(
      'General UI',
      name: 'generalUi',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homePage {
    return Intl.message(
      'Home',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `IFrame Demo`
  String get iframeDemo {
    return Intl.message(
      'IFrame Demo',
      name: 'iframeDemo',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid integer.`
  String get integerErrorText {
    return Intl.message(
      'This field requires a valid integer.',
      name: 'integerErrorText',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid IP.`
  String get ipErrorText {
    return Intl.message(
      'This field requires a valid IP.',
      name: 'ipErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login now!`
  String get loginNow {
    return Intl.message(
      'Login now!',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit`
  String get loremIpsum {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      name: 'loremIpsum',
      desc: '',
      args: [],
    );
  }

  /// `Value does not match pattern.`
  String get matchErrorText {
    return Intl.message(
      'Value does not match pattern.',
      name: 'matchErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Value must be less than or equal to {max}`
  String maxErrorText(Object max) {
    return Intl.message(
      'Value must be less than or equal to $max',
      name: 'maxErrorText',
      desc: '',
      args: [max],
    );
  }

  /// `Value must have a length less than or equal to {maxLength}`
  String maxLengthErrorText(Object maxLength) {
    return Intl.message(
      'Value must have a length less than or equal to $maxLength',
      name: 'maxLengthErrorText',
      desc: '',
      args: [maxLength],
    );
  }

  /// `Value must be greater than or equal to {min}.`
  String minErrorText(Object min) {
    return Intl.message(
      'Value must be greater than or equal to $min.',
      name: 'minErrorText',
      desc: '',
      args: [min],
    );
  }

  /// `Value must have a length greater than or equal to {minLength}`
  String minLengthErrorText(Object minLength) {
    return Intl.message(
      'Value must have a length greater than or equal to $minLength',
      name: 'minLengthErrorText',
      desc: '',
      args: [minLength],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  String get editCategory {
    return Intl.message(
      'Edit Category',
      name: 'editCategory',
      desc: '',
      args: [],
    );
  }

  String get addUser {
    return Intl.message(
      'Add User',
      name: 'addUser',
      desc: '',
      args: [],
    );
  }

  String get viewUser {
    return Intl.message(
      'View User',
      name: 'viewUser',
      desc: '',
      args: [],
    );
  }

  String get viewProvider {
    return Intl.message(
      'View Service Provider',
      name: 'viewProvider',
      desc: '',
      args: [],
    );
  }

  String get viewDriver {
    return Intl.message(
      'View Driver',
      name: 'viewDriver',
      desc: '',
      args: [],
    );
  }

  String get addAdmin{
    return Intl.message(
      'Add Admin',
      name: 'Admin',
      desc: '',
      args: [],
    );
  }

  String get addArea {
    return Intl.message(
      'Add Area',
      name: 'addArea',
      desc: '',
      args: [],
    );
  }

  String get addBusLayout {
    return Intl.message(
      'Add Bus Layout',
      name: 'addBusLayout',
      desc: '',
      args: [],
    );
  }

  String get viewBusLayout {
    return Intl.message(
      'View Bus Layout',
      name: 'viewBusLayout',
      desc: '',
      args: [],
    );
  }

  String get updateArea {
    return Intl.message(
      'Update Area',
      name: 'updateArea',
      desc: '',
      args: [],
    );
  }

  String get addDriver {
    return Intl.message(
      'Add Category',
      name: 'addDriver',
      desc: '',
      args: [],
    );
  }

  String get addAge {
    return Intl.message(
      'Add Age',
      name: 'addAge',
      desc: '',
      args: [],
    );
  }

  String get addBrand {
    return Intl.message(
      'Add Brand',
      name: 'addBrand',
      desc: '',
      args: [],
    );
  }

  String get addSchool {
    return Intl.message(
      'Add School',
      name: 'addSchool',
      desc: '',
      args: [],
    );
  }

  String get updateSchool {
    return Intl.message(
      'Update School',
      name: 'updateSchool',
      desc: '',
      args: [],
    );
  }

  String get updateReceipt {
    return Intl.message(
      'Update Receipt',
      name: 'updateReceipt',
      desc: '',
      args: [],
    );
  }

  String get editUser {
    return Intl.message(
      'Edit User',
      name: 'editUser',
      desc: '',
      args: [],
    );
  }

  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  String get editProduct {
    return Intl.message(
      'Edit Product',
      name: 'editProduct',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{New Order} other{New Orders}}`
  String newOrders(num count) {
    return Intl.plural(
      count,
      one: 'New Order',
      other: 'New Orders',
      name: 'newOrders',
      desc: '',
      args: [count],
    );
  }

  String allCards(num count) {
    return Intl.plural(
      count,
      one: 'User Card',
      other: 'User Cards',
      name: 'userCards',
      desc: '',
      args: [count],
    );
  }

  String allsms(num count) {
    return Intl.plural(
      count,
      one: 'User Sms',
      other: 'User Sms',
      name: 'userSms',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{New User} other{New Users}}`
  String newUsers(num count) {
    return Intl.plural(
      count,
      one: 'New User',
      other: 'New Users',
      name: 'newUsers',
      desc: '',
      args: [count],
    );
  }

  String totalUser(num count) {
    return Intl.plural(
      count,
      one: 'Total User',
      other: 'Total User',
      name: 'totalUser',
      desc: '',
      args: [count],
    );
  }

  String totalPuser(num count) {
    return Intl.plural(
      count,
      one: 'Total Personal User ',
      other: 'Total Personal User ',
      name: 'totalPersonalUser',
      desc: '',
      args: [count],
    );
  }

  String totalBuser(num count) {
    return Intl.plural(
      count,
      one: 'Total Business User',
      other: 'Total Business User',
      name: 'totalBusinessUsert',
      desc: '',
      args: [count],
    );
  }

  String totalProduct(num count) {
    return Intl.plural(
      count,
      one: 'Total Product',
      other: 'Total Product',
      name: 'totalProductToday',
      desc: '',
      args: [count],
    );
  }

  String totalCompleteRequirement(num count) {
    return Intl.plural(
      count,
      one: 'Total Complete Requirement',
      other: 'Total Complete Requirement',
      name: 'totalCompleteRequirement',
      desc: '',
      args: [count],
    );
  }

  String totalRequirement(num count) {
    return Intl.plural(
      count,
      one: 'Total Requirement',
      other: 'Total Requirement',
      name: 'totalRequirement',
      desc: '',
      args: [count],
    );
  }

  String totalService(num count) {
    return Intl.plural(
      count,
      one: 'Total Service',
      other: 'Total Service ',
      name: 'totalService',
      desc: '',
      args: [count],
    );
  }

  String totalRequirementLetter(num count) {
    return Intl.plural(
      count,
      one: 'Total Requirement Letter',
      other: 'Total Requirement Letter',
      name: 'totalRequirementLetter',
      desc: '',
      args: [count],
    );
  }

  /// `This field value must not be equal to {value}.`
  String notEqualErrorText(Object value) {
    return Intl.message(
      'This field value must not be equal to $value.',
      name: 'notEqualErrorText',
      desc: '',
      args: [value],
    );
  }

  /// `Value must be numeric.`
  String get numericErrorText {
    return Intl.message(
      'Value must be numeric.',
      name: 'numericErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Open in new tab`
  String get openInNewTab {
    return Intl.message(
      'Open in new tab',
      name: 'openInNewTab',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Page} other{Pages}}`
  String pages(num count) {
    return Intl.plural(
      count,
      one: 'Page',
      other: 'Pages',
      name: 'pages',
      desc: '',
      args: [count],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `* 6 - 18 characters`
  String get passwordHelperText {
    return Intl.message(
      '* 6 - 18 characters',
      name: 'passwordHelperText',
      desc: '',
      args: [],
    );
  }

  /// `Password not match.`
  String get passwordNotMatch {
    return Intl.message(
      'Password not match.',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Pending Issue} other{Pending Issues}}`
  String pendingIssues(num count) {
    return Intl.plural(
      count,
      one: 'Pending Issue',
      other: 'Pending Issues',
      name: 'pendingIssues',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{Recent Order} other{Recent Orders}}`
  String recentOrders(num count) {
    return Intl.plural(
      count,
      one: 'Recent Order',
      other: 'Recent Orders',
      name: 'recentOrders',
      desc: '',
      args: [count],
    );
  }

  /// `Record deleted successfully.`
  String get recordDeletedSuccessfully {
    return Intl.message(
      'Record deleted successfully.',
      name: 'recordDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Record saved successfully.`
  String get recordSavedSuccessfully {
    return Intl.message(
      'Record saved successfully.',
      name: 'recordSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Record submitted successfully.`
  String get recordSubmittedSuccessfully {
    return Intl.message(
      'Record submitted successfully.',
      name: 'recordSubmittedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register a new account`
  String get registerANewAccount {
    return Intl.message(
      'Register a new account',
      name: 'registerANewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register now!`
  String get registerNow {
    return Intl.message(
      'Register now!',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty.`
  String get requiredErrorText {
    return Intl.message(
      'This field cannot be empty.',
      name: 'requiredErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Retype Password`
  String get retypePassword {
    return Intl.message(
      'Retype Password',
      name: 'retypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  String get gImage {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Text Emphasis`
  String get textEmphasis {
    return Intl.message(
      'Text Emphasis',
      name: 'textEmphasis',
      desc: '',
      args: [],
    );
  }

  /// `Text Theme`
  String get textTheme {
    return Intl.message(
      'Text Theme',
      name: 'textTheme',
      desc: '',
      args: [],
    );
  }

  /// `Today Sales`
  String get todaySales {
    return Intl.message(
      'Today Sales',
      name: 'todaySales',
      desc: '',
      args: [],
    );
  }

  /// `Typography`
  String get typography {
    return Intl.message(
      'Typography',
      name: 'typography',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{UI Element} other{UI Elements}}`
  String uiElements(num count) {
    return Intl.plural(
      count,
      one: 'UI Element',
      other: 'UI Elements',
      name: 'uiElements',
      desc: '',
      args: [count],
    );
  }

  /// `This field requires a valid URL address.`
  String get urlErrorText {
    return Intl.message(
      'This field requires a valid URL address.',
      name: 'urlErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

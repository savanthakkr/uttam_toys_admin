import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uttam_toys/constants/values.dart';

class UserDataProvider extends ChangeNotifier {
  var _userIts= '';
  var _username = '';
  var _userPhone = '';
  var _userID = '';
  var _isAdmin = '';

  String get userIts => _userIts;

  String get username => _username;

  String get userphone => _userPhone;

  String get userid => _userID;

  String get isAdmin => _isAdmin;

  Future<void> loadAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    _userID = sharedPref.getString(StorageKeys.userid) ?? '';
    _username = sharedPref.getString(StorageKeys.username) ?? '';
    _userPhone = sharedPref.getString(StorageKeys.userphone) ?? '';
    _userIts = sharedPref.getString(StorageKeys.userits) ?? '';
    _isAdmin = sharedPref.getString(StorageKeys.isadmin) ?? '';

    notifyListeners();
  }

  Future<void> setUserDataAsync({
    String? userIts,
    String? username,
    String? userphone,
    String? userid,
    String? isAdmin,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    var shouldNotify = false;

    if (userIts != null && userIts != _userIts) {
      _userIts = userIts;

      await sharedPref.setString(StorageKeys.userits, _userIts);

      shouldNotify = true;
    }

    if (username != null && username != _username) {
      _username = username;

      await sharedPref.setString(StorageKeys.username, _username);

      shouldNotify = true;
    }

    if (userphone != null && userphone != _userPhone) {
      _userPhone = userphone;

      await sharedPref.setString(StorageKeys.userphone, _userPhone);

      shouldNotify = true;
    }

    if (userid != null && userid != _userID) {
      _userID = userid;

      await sharedPref.setString(StorageKeys.userid, _userID);

      shouldNotify = true;
    }

    if (isAdmin != null && isAdmin != _isAdmin) {
      _isAdmin = isAdmin;

      await sharedPref.setString(StorageKeys.isadmin, _isAdmin);

      shouldNotify = true;
    }

    if (shouldNotify) {
      notifyListeners();
    }
  }

  Future<void> clearUserDataAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove(StorageKeys.username);
    await sharedPref.remove(StorageKeys.userits);
    await sharedPref.remove(StorageKeys.userphone);
    await sharedPref.remove(StorageKeys.userid);
    await sharedPref.remove(StorageKeys.isadmin);

    _userID = '';
    _username = '';
    _userPhone = '';
    _userIts = '';
    _isAdmin = '';

    notifyListeners();
  }

  bool isUserLoggedIn() {
    return _username.isNotEmpty;
  }
}

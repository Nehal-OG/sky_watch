import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_watch/application/app_constants.dart';

//const String PREFS_KEY_LOGGED_IN = "PREFS_KEY_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_TEMP_FORMAT = "PREFS_TEMP_FORMAT";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> setUserToken(String token) async {
    await _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  String getUserToken() {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? Constant.empty;
  }

  Future<void> setTempFormate(String tempFormat) async {
    await _sharedPreferences.setString(PREFS_TEMP_FORMAT, tempFormat);
  }

  String getTempFormate() {
    return _sharedPreferences.getString(PREFS_TEMP_FORMAT) ?? Constant.empty;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const _rememberMeKey = 'rememberMe';
  final SharedPreferencesAsync _pref;

  const AuthPreferences({required this._pref});

  Future<void> setRememberMe({required bool value}) async {
    await _pref.setBool(_rememberMeKey, value);
  }

  Future<bool> getRememberMe() async {
    return await _pref.getBool(_rememberMeKey) ?? false;
  }
}

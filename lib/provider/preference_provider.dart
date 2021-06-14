import 'package:relay/config/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static final _preferenceController = PreferenceProvider._internal();
  factory PreferenceProvider() => _preferenceController;

  PreferenceProvider._internal();
  static SharedPreferences? _sharedPref;

  init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  saveToken(accessToken, refreshToken) async {
    await _sharedPref!.setString(PreferenceKey.AccessToken, accessToken);
    await _sharedPref!.setString(PreferenceKey.RefreshToken, refreshToken);
  }

  loadToken() {
    final accessToken = _sharedPref!.getString(PreferenceKey.AccessToken);
    final refreshToken = _sharedPref!.getString(PreferenceKey.RefreshToken);
    return [accessToken, refreshToken];
  }
}

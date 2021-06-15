import 'package:relay/config/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static final _preferenceController = PreferenceProvider._internal();
  factory PreferenceProvider() => _preferenceController;

  PreferenceProvider._internal();
  static SharedPreferences? _sharedPref;

  String _accessToken = '';
  String _refreshToken = '';

  init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  getAccessToken() => _accessToken;
  getRefreshToken() => _refreshToken;

  setTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  hasToken() {
    return _accessToken.isNotEmpty && _refreshToken.isNotEmpty;
  }

  saveToken(accessToken, refreshToken) async {
    await _sharedPref!.setString(PreferenceKey.AccessToken, accessToken);
    await _sharedPref!.setString(PreferenceKey.RefreshToken, refreshToken);
    setTokens(accessToken, refreshToken);
  }

  loadToken() {
    var accessToken = _sharedPref!.getString(PreferenceKey.AccessToken);
    var refreshToken = _sharedPref!.getString(PreferenceKey.RefreshToken);
    if (accessToken == null) accessToken = '';
    if (refreshToken == null) refreshToken = '';
    setTokens(accessToken, refreshToken);
    return [accessToken, refreshToken];
  }
}

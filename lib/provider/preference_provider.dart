import 'package:relay/config/config.dart';
import 'package:relay/config/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static final _preferenceProvider = PreferenceProvider._internal();
  factory PreferenceProvider() => _preferenceProvider;

  PreferenceProvider._internal();
  static late SharedPreferences _sharedPref;

  String _accessToken = '';
  String _refreshToken = '';

  init() async {
    _sharedPref = await SharedPreferences.getInstance();
    loadToken();
  }

  /// Token
  get accessToken => _accessToken;

  get refreshToken => _refreshToken;

  setTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  hasToken() {
    return _accessToken.isNotEmpty && _refreshToken.isNotEmpty;
  }

  saveToken(String? accessToken, String? refreshToken) async {
    if (accessToken == null || refreshToken == null) return;

    await _sharedPref.setString(PreferenceKey.AccessToken, accessToken);
    await _sharedPref.setString(PreferenceKey.RefreshToken, refreshToken);
    setTokens(accessToken, refreshToken);
  }

  deleteToken() async {
    await _sharedPref.remove(PreferenceKey.AccessToken);
    await _sharedPref.remove(PreferenceKey.RefreshToken);
  }

  loadToken() {
    var accessToken = _sharedPref.getString(PreferenceKey.AccessToken);
    var refreshToken = _sharedPref.getString(PreferenceKey.RefreshToken);

    if (accessToken == null || refreshToken == null) return ['', ''];

    setTokens(accessToken, refreshToken);
    return [accessToken, refreshToken];
  }

  /// 단어 계속 추가 (isKeepAdd)
  bool loadKeepAddWord() {
    bool? isKeepAddWord = _sharedPref.getBool(PreferenceKey.KeepAddWord);
    if (isKeepAddWord != null) return isKeepAddWord;
    return AppConfig.defaultKeepAddWord;
  }

  saveKeepAddWord(bool isKeepAddWord) async =>
      await _sharedPref.setBool(PreferenceKey.KeepAddWord, isKeepAddWord);

  /// 마지막으로 선택된 group id
  saveSelectedGroupId(int groupId) async =>
      await _sharedPref.setInt(PreferenceKey.LastSelectedGroupId, groupId);

  int loadSelectedGroupId() {
    int? id = _sharedPref.getInt(PreferenceKey.LastSelectedGroupId);
    if (id != null) return id;

    return -1;
  }
}

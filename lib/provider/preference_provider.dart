import 'package:relay/config/config.dart';
import 'package:relay/config/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static final _preferenceProvider = PreferenceProvider._internal();

  factory PreferenceProvider() => _preferenceProvider;

  PreferenceProvider._internal();

  static late SharedPreferences _sharedPref;

  String accessToken = '';
  String refreshToken = '';

  init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  hasToken() {
    if (accessToken.isEmpty && refreshToken.isEmpty) loadToken();
    return accessToken.isNotEmpty && refreshToken.isNotEmpty;
  }

  saveToken({String accessToken = '', String refreshToken = ''}) {
    if (accessToken.isNotEmpty) {
      accessToken = accessToken;
      _sharedPref.setString(PreferenceKey.AccessToken, accessToken);
    }

    if (refreshToken.isNotEmpty) {
      refreshToken = refreshToken;
      _sharedPref.setString(PreferenceKey.RefreshToken, refreshToken);
    }
  }

  deleteToken() async {
    await _sharedPref.remove(PreferenceKey.AccessToken);
    await _sharedPref.remove(PreferenceKey.RefreshToken);
  }

  loadToken() {
    var accessToken = _sharedPref.getString(PreferenceKey.AccessToken);
    var refreshToken = _sharedPref.getString(PreferenceKey.RefreshToken);
    print(refreshToken);

    if (accessToken == null || refreshToken == null) return ['', ''];

    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
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

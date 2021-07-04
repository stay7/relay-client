class AppConfig {
  static AppConfig _appConfig = AppConfig.internal();
  static const double HeaderSize = 48;
  static const int SplashDuration = 3;
  static const bool defaultKeepAddWord = true;
  static const double PageMarginHorizontal = 20;

  factory AppConfig() => _appConfig;

  AppConfig.internal();
}

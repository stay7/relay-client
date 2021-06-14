import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static AppConfig _appConfig = AppConfig.internal();
  static const double HeaderSize = 48;
  static const int SplashDuration = 3;
  final baseUrl = dotenv.env['BASE_URL'];

  factory AppConfig() => _appConfig;
  AppConfig.internal();
}

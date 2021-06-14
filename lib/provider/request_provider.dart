import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

// https://dev.to/fatihmert/flutter-extending-http-class-1-3p3h
class RequestProvider extends http.BaseClient {
  static final RequestProvider _request = RequestProvider.internal();

  final http.Client _client = new http.Client();
  static final baseUrl = dotenv.env['BASE_URL'];
  String _accessToken = '';
  String _refreshToken = '';

  factory RequestProvider() => _request;
  RequestProvider.internal();

  setTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $_accessToken';
    print('send token');
    return this._client.send(request);
  }
}

import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:relay/provider/preference_provider.dart';

// https://dev.to/fatihmert/flutter-extending-http-class-1-3p3h
class RequestProvider extends http.BaseClient {
  static final RequestProvider _request = RequestProvider.internal();

  final http.Client _client = new http.Client();
  static final baseUrl = dotenv.env['BASE_URL'];

  factory RequestProvider() => _request;
  RequestProvider.internal();

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    final accessToken = PreferenceProvider().getAccessToken();
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    return this._client.send(request);
  }
}

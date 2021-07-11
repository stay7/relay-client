import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:relay/controller/login_controller.dart';
import 'package:relay/provider/preference_provider.dart';

// https://dev.to/fatihmert/flutter-extending-http-class-1-3p3h
class RequestProvider extends http.BaseClient {
  static final RequestProvider _request = RequestProvider.internal();

  final http.Client _client = new http.Client();
  static final baseUrl = dotenv.env['BASE_URL'];

  factory RequestProvider() => _request;
  RequestProvider.internal();

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    LoginController controller = Get.find<LoginController>();
    if (!await controller.hasValidSession()) throw controller.isLogged(false);

    String accessToken = PreferenceProvider().accessToken;

    request.headers['Content-Type'] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    return this._client.send(request);
  }

  static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = jsonDecode(response.body);
        JsonEncoder encoder = JsonEncoder.withIndent('  ');
        print(
            'response ${response.statusCode}, ${encoder.convert(responseJson)}');
        return responseJson;
      case 300:
        throw ('300 에러');
      case 401:
        //TODO: 다시 요청
        throw ('401 에러');
      default:
        throw ('${response.statusCode} 에러');
    }
  }
}

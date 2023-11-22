import 'dart:convert';
import 'dart:io';

import 'package:weather_app/Data/Netwrok/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Data/app_exceptions.dart';

class ApiServices extends BaseApiServices {
  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException(
            'Error while communication ${response.statusCode}');
    }
  }

  @override
  Future getApi(String url) async {
    // ignore: prefer_typing_uninitialized_variables
    var jsonData;

    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('Request timeout');
    } on SocketException {
      throw InternetException('No internet');
    }
    return jsonData;
  }
}

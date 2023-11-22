import 'package:weather_app/Data/Netwrok/api_services.dart';
import 'package:weather_app/Resources/AppUrl/app_url.dart';

class HomeRepository {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}

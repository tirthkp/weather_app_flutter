import 'package:get/get.dart';
import 'package:weather_app/ViewModal/Controllers/home_controller.dart';

class SplashServices {
  static void getApiData() {
    final controller = Get.put(HomeController());
    controller.getData();
  }
}

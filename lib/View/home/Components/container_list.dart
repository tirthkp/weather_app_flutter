import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/View/home/Components/small_container.dart';
import 'package:weather_app/ViewModal/Controllers/home_controller.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => SmallContainer(
              text: '${controller.getCloudCover()}%',
              image: ImageAssets.heavyRain,
              color: Colors.black45,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => SmallContainer(
              text: '${controller.getWindSpeed()}km/hr',
              image: ImageAssets.wind,
              color: Colors.black45,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => SmallContainer(
              text: '${controller.getHumidity()}%',
              image: ImageAssets.sun,
              color: Colors.black45,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

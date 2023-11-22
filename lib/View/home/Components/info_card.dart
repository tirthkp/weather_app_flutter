import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilities/utilities.dart';
import 'package:weather_app/ViewModal/Controllers/home_controller.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 233,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 30),
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.black45,
                  Colors.black54,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: 10,
            child: Obx(
              () => Image.asset(
                controller.getImage(controller.currentIndex.value),
                height: 150,
                width: 170,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.getCondition(),
                    style: const TextStyle(
                      height: 0,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  Utilities.currentTime(),
                  style: TextStyle(
                    height: 0,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.1),
                      ],
                    ).createShader(bounds);
                  },
                  child: Obx(
                    () => Text(
                      controller.getCurrentTemp(),
                      style: const TextStyle(
                        fontSize: 60,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    'Feels Like ${controller.getFeelLike()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.1),
                  ],
                ).createShader(bounds);
              },
              child: Image.asset(
                ImageAssets.windWave,
                height: 100,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

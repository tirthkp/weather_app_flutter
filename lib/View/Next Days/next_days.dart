import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Colors/colors.dart';
import 'package:weather_app/View/Next%20Days/Components/bottom_list.dart';
import 'package:weather_app/View/Next%20Days/Components/days_list.dart';
import 'package:weather_app/ViewModal/Controllers/days_controller.dart';
import 'package:weather_app/ViewModal/Controllers/home_controller.dart';

import 'Components/app_bar.dart';

class NextDays extends StatelessWidget {
  NextDays({super.key});

  final homeController = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomAppBarz(),
                    const SizedBox(height: 20),
                    DaysList(),
                  ],
                ),
                Positioned(
                  bottom: 1,
                  child: Container(
                    height: size.height / 1.7,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
                BottomList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

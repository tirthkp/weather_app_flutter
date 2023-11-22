import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModal/Controllers/days_controller.dart';

class DaysList extends StatelessWidget {
  DaysList({super.key});

  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.homeController.model.value!.days!.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => GestureDetector(
              onTap: () => controller.setDay(index),
              child: Container(
                width: 65,
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: controller.currentDay.value == index
                      ? const Color(0xFF0a2351)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        controller.getImage(index),
                      ),
                    ),
                    Text(
                      controller.getMonth(index),
                      style: TextStyle(
                        color: controller.currentDay.value == index
                            ? Colors.white
                            : const Color(0xFF0a2351),
                        fontSize: 20,
                        height: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.getMonthDay(index),
                      style: TextStyle(
                        color: controller.currentDay.value == index
                            ? Colors.white
                            : const Color(0xFF0a2351),
                        fontSize: 20,
                        height: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

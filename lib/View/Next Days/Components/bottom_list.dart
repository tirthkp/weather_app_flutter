import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModal/Controllers/days_controller.dart';
import 'package:weather_app/ViewModal/Controllers/home_controller.dart';

class BottomList extends StatelessWidget {
  BottomList({super.key});

  final homeController = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 1,
      child: SizedBox(
        height: size.height / 2,
        width: size.width,
        child: ListView.builder(
          itemCount: homeController.model.value!.days!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white38,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 100,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF0a2351),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      daysController.getDate(index),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: daysController.getMinTemp(index),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const TextSpan(
                            text: '/',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: daysController.getMaxTemp(index),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      daysController.getImage(index),
                      height: 70,
                      width: 70,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

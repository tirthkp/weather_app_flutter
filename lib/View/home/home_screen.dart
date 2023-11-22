import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Colors/colors.dart';
import 'package:weather_app/View/Next%20Days/next_days.dart';
import 'package:weather_app/View/home/Components/appbar.dart';
import 'package:weather_app/View/home/Components/container_list.dart';
import 'package:weather_app/View/home/Components/hours_list.dart';
import 'package:weather_app/View/home/Components/info_card.dart';
import 'package:weather_app/View/home/Components/location.dart';
import 'package:weather_app/ViewModal/Controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: AppColors.buildGradientBoxDecoration(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const CustomAppBar(),
                  Location(),
                  Hero(
                    tag: 'TAG',
                    child: Material(
                      color: Colors.transparent,
                      child: InfoCard(),
                    ),
                  ),
                  ContainerList(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.to(() => NextDays()),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Next 14 days ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  HoursList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call state management
  final GlobalController globalController = Get.put(
    GlobalController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Obx(() => globalController.checkLoading().isTrue
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const HeaderWidget(),
                        CurrentWeatherWidget(
                            currentWeather: globalController.currentWeather),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                        ),
                        Container(
                          height: 1,
                          width: 1,
                          color: CustomColors.dividerLine,
                        ),
                        ComfortLevelWidget(
                          currentWeather: globalController.currentWeather,
                        ),
                      ],
                    ),
                  ))),
      ),
    );
  }
}

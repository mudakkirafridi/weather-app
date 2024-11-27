import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
                ? buildShimmerEffect()
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

Widget buildShimmerEffect() {
  return Column(
    children: [
      shimmerBox(height: 100, width: double.infinity), // Header shimmer
      const SizedBox(height: 20),
      shimmerBox(
          height: 150, width: double.infinity), // Current weather shimmer
      const SizedBox(height: 20),
      shimmerBox(height: 50, width: double.infinity), // Divider shimmer
      const SizedBox(height: 20),
      shimmerBox(height: 200, width: double.infinity), // Comfort level shimmer
    ],
  );
}

Widget shimmerBox({required double height, required double width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

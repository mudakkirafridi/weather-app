import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/utils/custom_colors.dart';

class ComfortLevelWidget extends StatelessWidget {
  final CurrentWeather currentWeather;
  const ComfortLevelWidget({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: const Text(
            'Comfort Level',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
          ),
        ),
        SizedBox(
          height: 200,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                      infoProperties: InfoProperties(
                          bottomLabelText: 'Humanity',
                          bottomLabelStyle: const TextStyle(
                              letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                      animationEnabled: true,
                      size: 150,
                      customColors: CustomSliderColors(progressBarColors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor
                      ])),
                  initialValue: currentWeather.main!.humidity!.toDouble(),
                  min: 0,
                  max: 100,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Feel Like: ${(currentWeather.main!.feelsLike! - 273.15).toStringAsFixed(2)}°',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Sea Level Pressure: ${currentWeather.main!.seaLevel!}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

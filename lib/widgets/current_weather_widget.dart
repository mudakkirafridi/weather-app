import 'package:flutter/material.dart';
import 'package:weather_app/model/current_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeather currentWeather;
  const CurrentWeatherWidget({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(currentWeather.sys!.country!),
    );
  }
}

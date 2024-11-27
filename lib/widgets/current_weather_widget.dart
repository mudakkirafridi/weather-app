import 'package:flutter/material.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeather currentWeather;
  const CurrentWeatherWidget({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temep area
        temperatureAreaWidget(),
        // more details  widget
        const SizedBox(
          height: 20,
        ),
        moreDetailWidgetArea(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${currentWeather.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 80,
          width: 2,
          color: CustomColors.dividerLine,
        ),
        Column(
          children: [
            Text("${(currentWeather.main!.temp! - 273.15).toStringAsFixed(2)}°",
                style: const TextStyle(
                    color: CustomColors.textColorBlack, fontSize: 50)),
            Text(currentWeather.weather![0].description.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    height: -1,
                    fontSize: 14))
          ],
        )
      ],
    );
  }

  Widget moreDetailWidgetArea() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/windspeed.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/clouds.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/humidity.png'),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Center(
                  child: Text(
                '${currentWeather.wind!.speed.toString()} m/s',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Center(
                  child: Text(
                '${currentWeather.clouds!.all.toString()} %',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Center(
                  child: Text(
                '${currentWeather.main!.humidity.toString()} %',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )),
            )
          ],
        )
      ],
    );
  }
}

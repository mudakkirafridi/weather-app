import 'dart:convert';

import 'package:weather_app/model/current_weather.dart';
import 'package:http/http.dart' as http;

class FetchWeatherApi {
  Future<CurrentWeather> currentWeather(lat, lon) async {
    final response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(data);
    } else {
      throw 'error in main code';
    }
  }

  String apiUrl(lat, lon) {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&appid=7423c21367ce1c532ef3cba4ea0e6840&lon=$lon';
    return url;
  }
}

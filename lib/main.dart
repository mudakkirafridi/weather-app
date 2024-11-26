import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
// 7423c21367ce1c532ef3cba4ea0e6840
// our full url = https://api.openweathermap.org/data/2.5/weather?q=London&appid=7423c21367ce1c532ef3cba4ea0e6840
// https://api.openweathermap.org/data/2.5/weather?lat=34.0959&appid=7423c21367ce1c532ef3cba4ea0e6840&lon=71.1509
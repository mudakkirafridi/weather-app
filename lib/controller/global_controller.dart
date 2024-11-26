import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils.dart';

class GlobalController extends GetxController {
  // create variour variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // instances for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  // get location method within init function
  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    // first of all we need to check that the location service is enable or not
    bool isServiceEnable = await Geolocator.isLocationServiceEnabled();

    // return if service is not enable
    if (!isServiceEnable) {
      return Get.snackbar("Error", 'Please Enable Location');
    }

    // status of permission request
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Get.snackbar("Error", 'Location Permission Denied Forever');
    } else if (locationPermission == LocationPermission.denied) {
      // if only denied then again request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Get.snackbar("Error", 'Location Permission is Denied');
      }
    }

    // getting current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our longitude and latitude i mean our variables
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    });
  }
}

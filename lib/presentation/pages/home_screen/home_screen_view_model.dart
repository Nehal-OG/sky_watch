import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sky_watch/application/app_prefs.dart';
import 'package:sky_watch/application/functions.dart';
import 'package:sky_watch/data/network/app_api.dart';
import 'package:sky_watch/data/repository_impl/repository_impl.dart';
import 'package:sky_watch/domain/models/models.dart';
import 'package:sky_watch/presentation/resources/constants_manager.dart';
import 'package:sky_watch/presentation/resources/get_manager.dart';

class WeatherViewModel extends GetxController {
  WeatherViewModel();
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  WeatherCityRepository weatherCityRepository =
      WeatherCityRepository(WeatherCityService());
  WeatherRepository weatherRepository = WeatherRepository(WeatherService());
  final weatherCityResponse = Rx<CityModel?>(null);

  WeatherData weatherResponse = Get.arguments[GetArguments.weather];

  final TextEditingController cityController = TextEditingController();
  RxBool currentLoction = true.obs;
  RxString? temp;
  RxString? maxTemp;
  RxString? weatherIcon;
  RxString? desc;
  RxString? tempFormate;

  RxDouble? tempFahrenheit;
  RxDouble? maxTempFahrenheit;

  @override
  void onInit() async {
    super.onInit();

    initialize();
    if (tempFormate!.value == AppConstants.celsius) {
      temp = weatherResponse.temperature.toString().obs;
      maxTemp = weatherResponse.maxTemperature.toString().obs;
      weatherIcon = getWeatherIcon(
              double.parse(temp.toString()), double.parse(maxTemp.toString()))
          .obs;
      desc = getMessage(
              double.parse(temp.toString()), double.parse(maxTemp.toString()))
          .obs;
    } else {
      tempFahrenheit = celsiusToFahrenheit(
              double.parse(weatherResponse.temperature.toString()))
          .obs;
      temp = tempFahrenheit.toString().obs;
      maxTempFahrenheit = celsiusToFahrenheit(
              double.parse(weatherResponse.maxTemperature.toString()))
          .obs;
      maxTemp = maxTempFahrenheit.toString().obs;
      weatherIcon = getWeatherIcon(
              double.parse(temp.toString()), double.parse(maxTemp.toString()))
          .obs;
      desc = getMessage(
              double.parse(temp.toString()), double.parse(maxTemp.toString()))
          .obs;
    }
  }

// Get info which temp type the user has selected for setting.
  initialize() {
    tempFormate = _appPreferences.getTempFormate() == AppConstants.celsius
        ? AppConstants.celsius.obs
        : AppConstants.fahrenheit.obs;
  }

  // Method for converting Celsius to fahrenheit
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

// To get current Position and to get permission
  Future<void> getCurrentPosition() async {
    currentLoction = true.obs;
    Geolocator.checkPermission();
    Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition();
    getWeather(position.latitude, position.longitude);
  }

// Method to get data based on current location

  Future<void> getWeather(double latitude, double longitude) async {
    weatherResponse = await weatherRepository.getWeather(latitude, longitude);
    initialize();
    if (tempFormate!.value == AppConstants.celsius) {
      temp!.value = weatherResponse.temperature.toString();
      maxTemp!.value = weatherResponse.maxTemperature.toString();
      weatherIcon!.value = getWeatherIcon(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
      desc!.value = getMessage(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
    } else {
      tempFahrenheit!.value = celsiusToFahrenheit(
          double.parse(weatherResponse.temperature.toString()));
      temp!.value = tempFahrenheit.toString();
      maxTempFahrenheit!.value = celsiusToFahrenheit(
          double.parse(weatherResponse.maxTemperature.toString()));
      maxTemp!.value = maxTempFahrenheit.toString();
      weatherIcon!.value = getWeatherIcon(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
      desc!.value = getMessage(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
    }
  }

// Method to get data based on city location

  Future<void> getCityWeather(String city) async {
    currentLoction = false.obs;
    weatherCityResponse.value = await weatherCityRepository
        .getCityWeather(cityController.text.toLowerCase());
    initialize();
    if (tempFormate!.value == AppConstants.celsius) {
      temp!.value = weatherCityResponse.value!.temperature.toString();
      maxTemp!.value = weatherCityResponse.value!.maxTemperature.toString();
      weatherIcon!.value = getWeatherIcon(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
      desc!.value = getMessage(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
    } else {
      tempFahrenheit!.value = celsiusToFahrenheit(
          double.parse(weatherResponse.temperature.toString()));
      temp!.value = tempFahrenheit.toString();
      maxTempFahrenheit!.value = celsiusToFahrenheit(
          double.parse(weatherResponse.maxTemperature.toString()));
      maxTemp!.value = maxTempFahrenheit.toString();
      weatherIcon!.value = getWeatherIcon(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
      desc!.value = getMessage(
          double.parse(temp.toString()), double.parse(maxTemp.toString()));
    }
  }

// set of Icons
  String getWeatherIcon(double temp, double maxTemp) {
    if (tempFormate!.value == AppConstants.celsius) {
      if (temp > 0 && maxTemp <= 10) {
        return '☃️';
      } else if (temp > 10 && maxTemp <= 20) {
        return '☔️';
      } else if (temp > 20 && maxTemp <= 30) {
        return '☁️';
      } else if (temp > 30 && maxTemp <= 40) {
        return '🌩';
      } else if (temp > 40) {
        return '☀️';
      } else {
        return '🤷‍';
      }
    } else {
      if (temp > 33 && maxTemp <= 50) {
        return '☃️';
      } else if (temp > 50 && maxTemp <= 68) {
        return '☔️';
      } else if (temp > 68 && maxTemp <= 86) {
        return '☁️';
      } else if (temp > 86 && maxTemp <= 104) {
        return '🌩';
      } else if (temp > 104) {
        return '☀️';
      } else {
        return '🤷‍';
      }
    }
  }

// set of descripition of weather
  String getMessage(double temp, double maxTemp) {
    if (tempFormate!.value == AppConstants.celsius) {
      if (temp > 0 && maxTemp <= 10) {
        return 'You\'ll need 🧣 and 🧤';
      } else if (temp > 10 && maxTemp <= 20) {
        return 'Bring ☔️  just in case';
      } else if (temp > 20 && maxTemp <= 30) {
        return 'Time for shorts and 👕';
      } else if (temp > 30 && maxTemp <= 40) {
        return 'Bring a 🧥 just in case';
      } else if (temp > 40) {
        return 'It\'s 🍦 time' 'and' 'Time for shorts and 👕';
      } else {
        return '🤷‍';
      }
    } else {
      if (temp > 33 && maxTemp <= 50) {
        return 'You\'ll need 🧣 and 🧤';
      } else if (temp > 50 && maxTemp <= 68) {
        return 'Bring ☔️  just in case';
      } else if (temp > 68 && maxTemp <= 86) {
        return 'Time for shorts and 👕';
      } else if (temp > 86 && maxTemp <= 104) {
        return 'Bring a 🧥 just in case';
      } else if (temp > 104) {
        return 'It\'s 🍦 time' 'and' 'Time for shorts and 👕';
      } else {
        return '🤷‍';
      }
    }
  }

  void showError(BuildContext context) {
    showErrorDialog(
      context,
      errorText: 'Please Enter A City name',
    );
  }
}

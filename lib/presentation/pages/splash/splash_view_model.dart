import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sky_watch/data/database/database_helper.dart';
import 'package:sky_watch/data/network/app_api.dart';
import 'package:sky_watch/data/repository_impl/repository_impl.dart';
import 'package:sky_watch/domain/models/models.dart';
import 'package:sky_watch/presentation/resources/get_manager.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/route_manager.dart';

class SplashViewModel extends GetxController {
  WeatherRepository weatherRepository = WeatherRepository(WeatherService());
  final databaseHelper = DatabaseHelper();
  @override
  void onInit() async {
    await _getCurrentPosition();
    _moveToHomeScreen();
    super.onInit();
  }

  final weatherResponse = Rx<WeatherData?>(null);
  WeatherData? weatherData;
  Future<void> _getCurrentPosition() async {
    // Get the current network connectivity status
    final connectivityResult = await Connectivity().checkConnectivity();

    // Check if the device is connected to the internet.
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // The device is connected to the internet.
      Geolocator.checkPermission();
      Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition();
      getWeather(position.latitude, position.longitude);
    } else {
      // The device is not connected to the internet.
      final latestWeatherData = await databaseHelper.getLatestWeatherData();
      print(latestWeatherData!.cloudPercentage.toString());
      weatherData = latestWeatherData;
    }
  }

  Future<void> getWeather(double latitude, double longitude) async {
    weatherResponse.value =
        await weatherRepository.getWeather(latitude, longitude);
  }

  void _moveToHomeScreen() async {
    await Future.delayed(
        const Duration(seconds: AppConstants.splashDelayseconds), () async {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Get.offNamed(
          Routes.homeScreenRoute,
          arguments: {GetArguments.weather: weatherResponse.value},
        );
      } else {
        Get.offNamed(
          Routes.homeScreenRoute,
          arguments: {GetArguments.weather: weatherData},
        );
      }
    });
  }
}

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_watch/data/network/dio_factory.dart';
import 'package:sky_watch/presentation/pages/home_screen/home_screen_view_model.dart';
import 'package:sky_watch/presentation/pages/settings/settings_view_model.dart';
import 'package:sky_watch/presentation/pages/splash/splash_view_model.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import '../data/network/network_info.dart';
import 'app_prefs.dart';

// Initilazing Everything that need to start before the Application is build
Future<void> initAppModule() async {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = AppSizes.s45
    ..radius = AppRadius.r10
    ..progressColor = ColorManager.primary
    ..backgroundColor = ColorManager.white
    ..indicatorColor = ColorManager.primary
    ..textColor = ColorManager.primary
    //..maskColor = CoColor.fromARGB(255, 20, 28, 33)city(0.3)
    ..userInteractions = true
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.black
    ..toastPosition = EasyLoadingToastPosition.bottom;

  final sharedPreferences = await SharedPreferences.getInstance();

  // Shared Preferences
  Get.lazyPut<SharedPreferences>(() => sharedPreferences, fenix: true);

  // App Preferences
  // = () => AppPreferences(instance()));
  Get.lazyPut<AppPreferences>(
      () => AppPreferences(Get.find<SharedPreferences>()),
      fenix: true);

  // Network Info
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()),
      fenix: true);

  // Dio Factory
  Get.lazyPut<DioFactory>(() => DioFactory(), fenix: true);

  // Network Info
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()),
      fenix: true);
}

initSplashModule() {
  if (!Get.isRegistered<SplashViewModel>()) {
    // Splash View Model
    Get.put(SplashViewModel());
  }
}

initLoginModule() {
  if (!Get.isRegistered()) {
    // Home
    Get.lazyPut<WeatherViewModel>(() => WeatherViewModel());
  }
}

// SETTINGS
initSettingsModule() {
  if (!Get.isRegistered<SettingsViewModel>()) {
    // Setting
    Get.lazyPut<SettingsViewModel>(() => SettingsViewModel());
  }
}

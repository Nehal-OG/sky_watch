import 'package:get/get.dart';
import 'package:sky_watch/application/di.dart';
import 'package:sky_watch/presentation/pages/home_screen/home_screen_view.dart';
import 'package:sky_watch/presentation/pages/settings/settings_view.dart';
import 'package:sky_watch/presentation/pages/splash/splash_view.dart';
import 'package:sky_watch/presentation/pages/unknown/unknown_view.dart';

class Routes {
  /// SPLASH
  static const String splashRoute = '/';

  /// Home screen
  static const String homeScreenRoute = '/homeScreen';

  /// SETTINGS
  static const String settingsRoute = '/settings';

  /// UNKNOWN
  static const String unknownRoute = '/notFound';
}

class RouteGenerator {
  static List<GetPage<dynamic>> getPages = [
    /// SPLASH
    GetPage(
      name: Routes.splashRoute,
      page: () {
        initSplashModule();
        return const SplashView();
      },
    ),

    /// Home screen
    GetPage(
      name: Routes.homeScreenRoute,
      page: () {
        initLoginModule();
        return const WeatherView();
      },
    ),

    /// Setting
    GetPage(
      name: Routes.settingsRoute,
      page: () {
        initSettingsModule();
        return const SettingsView();
      },
    ),
  ];

  /// UNKNOWN
  static GetPage<dynamic> unknownRoute = GetPage(
    name: Routes.unknownRoute,
    page: () => const UnknownView(),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../presentation/resources/route_manager.dart';
import '../presentation/resources/theme_manager.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); //named constructor

  static const MyApp _instance =
      MyApp._internal(); // returns single instance or singleton

  /// FACTORY CONSTRUCTOR USES (can be used)
  /// to create instances of subclasses (for example depending on the passed parameter
  /// to return a cached instance instead of a new one
  /// to prepare calculated values to forward them as parameters to a normal constructor so that final fields can be initialized with them. This is often used to work around limitations of what can be done in an initializer list of a normal constructor (like error handling).

  factory MyApp() =>
      _instance; // factory constructor which returns an instance of the current class

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final AppPreferences _appPreferences = instance<AppPreferences>();
  // @override
  // void didChangeDependencies() {
  //   _appPreferences.getLocale().then((locale) => context.setLocale(locale));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getPages,
      unknownRoute: RouteGenerator.unknownRoute,
      theme: getApplicationTheme(),
      builder: EasyLoading.init(),
    );
  }
}

import 'package:flutter/material.dart';

import 'application/app.dart';
import 'application/di.dart';

void main() async {
  // WidgetFlutterBinding is used to interact with the Flutter engine (middle layer from flutter architecture)
  WidgetsFlutterBinding.ensureInitialized();

  // check that all await functions are ready to build then build the app
  await initAppModule();

  runApp(MyApp());
}

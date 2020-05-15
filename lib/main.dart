import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bonapp/screens/application/menu/menu_screen.dart';
import 'package:flutter_bonapp/screens/intro_screen.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'services/router.dart' as router;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  setupLocator();

  runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: DevicePreview.of(context)?.locale,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: Color(primaryColour),
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: IntroScreenRoute,
//      home: MenuScreen(),
      home: IntroScreen(),
    );
  }
}

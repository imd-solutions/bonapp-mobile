import 'package:flutter/material.dart';
import 'package:flutter_bonapp/screens/application/initial/initial_screen.dart';
import 'package:flutter_bonapp/screens/auth/login/login_screen.dart';
import 'package:flutter_bonapp/screens/auth/register/register_screen.dart';
import 'package:flutter_bonapp/screens/intro_screen.dart';
import 'package:flutter_bonapp/screens/undefind_screen.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case IntroScreenRoute:
      return MaterialPageRoute(
        builder: (context) => IntroScreen(),
      );
    case LoginScreenRoute:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    case RegisterScreenRoute:
      return MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      );
    case InitialScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => InitialScreen(
          user: arguments,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ),
      );
  }
}

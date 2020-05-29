import 'package:flutter/material.dart';
import 'package:flutter_bonapp/screens/application/account/account_screen.dart';
import 'package:flutter_bonapp/screens/application/category/category_screen.dart';
import 'package:flutter_bonapp/screens/application/favourites/favourite_screen.dart';
import 'package:flutter_bonapp/screens/application/initial/initial_screen.dart';
import 'package:flutter_bonapp/screens/application/item/item_screen.dart';
import 'package:flutter_bonapp/screens/application/orders/orders_screen.dart';
import 'package:flutter_bonapp/screens/application/posts/posts_screen.dart';
import 'package:flutter_bonapp/screens/application/settings/settings_screen.dart';
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
    case PostsScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => PostsScreen(
          posts: arguments,
        ),
      );
    case CategoryScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => CategoryScreen(
          category: arguments,
        ),
      );
    case ItemScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ItemScreen(
          item: arguments,
        ),
      );
    case SettingsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      );
    case OrdersScreenRoute:
      return MaterialPageRoute(
        builder: (context) => OrdersScreen(),
      );
    case FavouritesScreenRoute:
      return MaterialPageRoute(
        builder: (context) => FavouriteScreen(),
      );
    case AccountScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => AccountScreen(
          user: arguments
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

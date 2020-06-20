import 'package:flutter/material.dart';
import 'package:flutter_bonapp/screens/application/about/about_screen.dart';
import 'package:flutter_bonapp/screens/application/account/account_screen.dart';
import 'package:flutter_bonapp/screens/application/cart/cart_screen.dart';
import 'package:flutter_bonapp/screens/application/category/category_screen.dart';
import 'package:flutter_bonapp/screens/application/checkout/checkout_screen.dart';
import 'package:flutter_bonapp/screens/application/faq/faq_screen.dart';
import 'package:flutter_bonapp/screens/application/favourites/favourite_screen.dart';
import 'package:flutter_bonapp/screens/application/initial/initial_screen.dart';
import 'package:flutter_bonapp/screens/application/item/item_screen.dart';
import 'package:flutter_bonapp/screens/application/message/message_screen.dart';
import 'package:flutter_bonapp/screens/application/messages/messages_screen.dart';
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
      return MaterialPageRoute(
        builder: (context) => PostsScreen(),
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
    case CartScreenRoute:
      return MaterialPageRoute(
        builder: (context) => CartScreen(),
      );
    case CheckoutScreenRoute:
      return MaterialPageRoute(
        builder: (context) => CheckoutScreen(),
      );
    case SettingsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      );
    case OrdersScreenRoute:
      return MaterialPageRoute(
        builder: (context) => OrderScreen(),
      );
    case FaqScreenRoute:
      return MaterialPageRoute(
        builder: (context) => FaqScreen(),
      );
    case AboutScreenRoute:
      return MaterialPageRoute(
        builder: (context) => AboutScreen(),
      );
    case FavouritesScreenRoute:
      return MaterialPageRoute(
        builder: (context) => FavouriteScreen(),
      );
    case MessagesScreenRoute:
      return MaterialPageRoute(
        builder: (context) => MessagesScreen(),
      );
    case MessageScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => MessageScreen(message: arguments),
      );
    case AccountScreenRoute:
      var arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => AccountScreen(user: arguments),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ),
      );
  }
}

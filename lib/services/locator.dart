import 'package:flutter_bonapp/services/application_service.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/faq_service.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/services/message_service.dart';
import 'package:flutter_bonapp/services/offer_service.dart';
import 'package:flutter_bonapp/services/order_service.dart';
import 'package:flutter_bonapp/services/page_service.dart';
import 'package:flutter_bonapp/services/post_service.dart';
import 'package:flutter_bonapp/services/push_notification_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/application/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/login/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/menu/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/register/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/sliders/viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => ApplicationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => MenuService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => OfferService());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => FaqService());
  locator.registerLazySingleton(() => PageService());
  locator.registerLazySingleton(() => MessagesService());
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton(() => PushNotificationService());

  // Register view models
  locator.registerFactory<ApplicationViewModel>(() => ApplicationViewModel());
  locator.registerFactory<SliderListViewModel>(() => SliderListViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
  locator.registerFactory<MenuListViewModel>(() => MenuListViewModel());
}

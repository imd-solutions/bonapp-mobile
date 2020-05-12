import 'package:flutter_resp_mvvm/services/application_service.dart';
import 'package:flutter_resp_mvvm/services/user_service.dart';
import 'package:flutter_resp_mvvm/viewmodels/application/viewmodel.dart';
import 'package:flutter_resp_mvvm/viewmodels/login/viewmodel.dart';
import 'package:flutter_resp_mvvm/viewmodels/register/viewmodel.dart';
import 'package:flutter_resp_mvvm/viewmodels/sliders/viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => ApplicationService());
  locator.registerLazySingleton(() => UserService());

  // Register models
  locator.registerFactory<ApplicationViewModel>(() => ApplicationViewModel());
  locator.registerFactory<SliderListViewModel>(() => SliderListViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
}

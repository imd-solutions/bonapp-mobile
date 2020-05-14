import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/application.dart';
import 'package:flutter_bonapp/services/application_service.dart';
import 'package:flutter_bonapp/utils/enum.dart';

class ApplicationViewModel extends ChangeNotifier {
  Application _application;

  ApplicationViewModel({Application application}) : _application = application;

  var loadingStatus = LoadingStatus.loading;

  Future<void> populateApplicaionData() async {
    this.loadingStatus = LoadingStatus.loading;
    notifyListeners();

    Application application = await ApplicationService().getApplication();

    this._application = application;

    this.loadingStatus = this._application == null ? LoadingStatus.empty : LoadingStatus.completed;

    notifyListeners();
  }

  Future<Application> getApplicationData() async {
    Application application = await ApplicationService().getApplication();

    return application;
  }

  Application get info {
    return Application(
      name: this._application.name,
      version: this._application.version,
      environment: this._application.environment,
//      year: this._application.year,
    );
  }
}

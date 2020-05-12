import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/models/application.dart';
import 'package:flutter_resp_mvvm/services/application_service.dart';
import 'package:flutter_resp_mvvm/utils/enum.dart';

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

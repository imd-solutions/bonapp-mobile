import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/application.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/application/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();

  Application appInfo;
  int counter = 0;

  void initialise() {
    setState(ViewState.Busy);

    applicationViewModel.populateApplicaionData().then(
      (_) {
        this.appInfo = applicationViewModel.info;
        setState(ViewState.Completed);
      },
    );
  }
}

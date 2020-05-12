import 'package:flutter_resp_mvvm/enums/viewstate.dart';
import 'package:flutter_resp_mvvm/models/application.dart';
import 'package:flutter_resp_mvvm/services/locator.dart';
import 'package:flutter_resp_mvvm/viewmodels/application/viewmodel.dart';
import 'package:flutter_resp_mvvm/viewmodels/base_model.dart';

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

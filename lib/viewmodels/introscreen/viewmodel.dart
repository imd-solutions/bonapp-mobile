import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenViewModel extends BaseModel {
  int userID;

  void initialise() {
    setState(ViewState.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userID = prefs.getInt('userId');

    setState(ViewState.Completed);
    notifyListeners();
  }
}

import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  User user;

  void initialise() {
    setState(ViewState.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    if (id != null) {
      user = await userService.getUser(id);
    }

    setState(ViewState.Completed);
    notifyListeners();
  }
}

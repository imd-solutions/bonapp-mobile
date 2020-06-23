import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends BaseModel {
  UserService userService = locator<UserService>();

  User user;
  bool emailAlert;
  bool notificationAlerts;

  void initialise() {
    setState(ViewState.Busy);
    _updateData();
    notifyListeners();
  }

  updateStatus(String check) {
    if (check == 'email') {
      emailAlert = !emailAlert;
    }
    notifyListeners();
  }

  Future<void> _updateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int id = prefs.getInt('userId');

    User user = await userService.getUser(id);
    prefs.setString('userName', user.profile.firstname);
    prefs.setBool('emailAlert', user.profile.alerts.email);
    emailAlert = prefs.getBool('emailAlert');
    prefs.setBool('notificationAlerts', user.profile.alerts.notification);
    notificationAlerts = prefs.getBool('notificationAlerts');
    notifyListeners();
  }
}

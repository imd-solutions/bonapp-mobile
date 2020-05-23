import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialViewModel extends BaseModel {
  UserService userService = locator<UserService>();

  int bottomNavIndex = 0;

  void initialise(int id) {
    _updateData(id);
    notifyListeners();
  }

  updateStatus(String check) {

    notifyListeners();
  }

  Future<void> _updateData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', id);

    notifyListeners();
  }

  void updateBottomNavIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }
}

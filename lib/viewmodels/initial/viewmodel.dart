import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/screens/auth/login/login_screen.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  User user;

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

  Future<void> logUserOut(context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', null);

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (route) => false);

  }

  void updateBottomNavIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/screens/auth/login/login_screen.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/message_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  MessagesService messagesService = locator<MessagesService>();

  User user;
  List<Messages> userUnreadMessages;

  int bottomNavIndex = 0;

  void initialise(int id) {
    setState(ViewState.Busy);
    _updateData(id);
    notifyListeners();
  }

  updateStatus(String check) {
    notifyListeners();
  }

  Future<void> _updateData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', id);
    userUnreadMessages = await messagesService.getUnreadUserMessages(id);

    setState(ViewState.Completed);
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

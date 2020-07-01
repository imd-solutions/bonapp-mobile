import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/application.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/screens/auth/login/login_screen.dart';
import 'package:flutter_bonapp/services/application_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/message_service.dart';
import 'package:flutter_bonapp/services/push_notification_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  MessagesService messagesService = locator<MessagesService>();
  ApplicationService applicationService = locator<ApplicationService>();
  PushNotificationService _pushNotificationService = locator<PushNotificationService>();

  User user;
  Application application;
  List<Messages> userUnreadMessages;
  FirebaseMessaging firebaseMessaging;

  int bottomNavIndex = 0;

  void initialise(int id, BuildContext context) {
    setState(ViewState.Busy);
    _updateData(id, context);
    notifyListeners();
  }

  updateStatus(String check) {
    notifyListeners();
  }

  Future<void> _updateData(int id, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', id);
    user = await userService.getUser(id);
    application = await applicationService.getApplication();
    userUnreadMessages = await messagesService.getUnreadUserMessages(id);
    // Register for push notifications
    firebaseMessaging = await _pushNotificationService.initialise(context);

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

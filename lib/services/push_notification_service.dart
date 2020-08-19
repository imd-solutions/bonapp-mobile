import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locator.dart';

class PushNotificationService {
  UserService userService = locator<UserService>();
  final FirebaseMessaging _fcm = FirebaseMessaging();

  User user;

  Future initialise(BuildContext context) async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    }

//    _fcm.getToken().then((token) {
//      print(token);
//    });

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        var notification = message['notification'];
        var title = await notification['title'];
        var body = await notification['body'];
        await _showAlert(title, body, context);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        _serialiseAndNavigate(message, context);
      },
    );
  }

  Future<void> _serialiseAndNavigate(Map<String, dynamic> message, BuildContext context) async {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the ---
      if (view == 'new_message') {
        Navigator.pushNamed(context, MessagesScreenRoute);
      }

      if (view == 'new_voucher') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int uid = prefs.getInt('userId');
        user = await userService.getUser(uid);
        Navigator.pushNamed(context, InitialScreenRoute, arguments: user);
      }
    }
  }

  Future<void> _showAlert(String title, String body, BuildContext context) async {
    Flushbar(
      title: title,
      message: body,
      backgroundColor: Color(accentSecondColour),
      duration: Duration(seconds: 5),
    )..show(context);
  }
}

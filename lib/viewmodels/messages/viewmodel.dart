import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/message_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageViewModel extends BaseModel {
  MessagesService messagesService = locator<MessagesService>();
  Message message;

  void initialise(int id) {
    _markMessageAsRead(id);
    notifyListeners();
  }

  Future<void> _markMessageAsRead(int id) async {
    message = await messagesService.markMessageAsRead(id);
    notifyListeners();
  }

  Future<Message> deleteMessage(int id) async {
    setState(ViewState.Processing);
    notifyListeners();
    Message response = await messagesService.deleteMessage(id);
    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }
}

class MessagesViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  MessagesService messagesService = locator<MessagesService>();

  User user;
  List<Messages> userMessages;
  List<Messages> userUnreadMessages;
  Message message;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updateMessagesInfo();
    notifyListeners();
  }

  Future<void> _updateMessagesInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);
    userMessages = await messagesService.getAllUserMessages(uid);
    userUnreadMessages = await messagesService.getUnreadUserMessages(uid);

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<Message> deleteMessage(int id) async {
    message = await messagesService.deleteMessage(id);
    notifyListeners();
  }
}

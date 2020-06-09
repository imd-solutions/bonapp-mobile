import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/message_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesViewModel extends BaseModel {

  MessagesService messagesService = locator<MessagesService>();

  List<Messages> userMessages;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updateMessagesInfo();
    notifyListeners();
  }

  Future<void> _updateMessagesInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    userMessages = await messagesService.getAllUserMessages(uid);

    setState(ViewState.Completed);
    notifyListeners();
  }
}

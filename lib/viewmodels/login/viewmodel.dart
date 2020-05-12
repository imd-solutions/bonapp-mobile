import 'package:flutter_resp_mvvm/enums/viewstate.dart';
import 'package:flutter_resp_mvvm/models/message.dart';
import 'package:flutter_resp_mvvm/models/user.dart';
import 'package:flutter_resp_mvvm/services/locator.dart';
import 'package:flutter_resp_mvvm/services/user_service.dart';
import 'package:flutter_resp_mvvm/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  UserService userService = locator<UserService>();

  Future<Message> logUserIn(User user) async {
    setState(ViewState.Processing);
    notifyListeners();

    Message response = await userService.loginUser(user);

    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }

  Future<Message> getForgottenPassword(String email) async {
    Message response = await userService.forgottenPassword(email);

    notifyListeners();

    return response;
  }
}

import 'package:flutter_resp_mvvm/enums/viewstate.dart';
import 'package:flutter_resp_mvvm/models/message.dart';
import 'package:flutter_resp_mvvm/models/title.dart';
import 'package:flutter_resp_mvvm/models/user.dart';
import 'package:flutter_resp_mvvm/services/locator.dart';
import 'package:flutter_resp_mvvm/services/user_service.dart';
import 'package:flutter_resp_mvvm/viewmodels/base_model.dart';
import 'package:flutter_resp_mvvm/viewmodels/titles/viewmodel.dart';

class RegisterViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  List<TitleViewModel> titles = List<TitleViewModel>();
  int selectedDropdown = 0;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();

    this.getAllTitles();
    notifyListeners();
  }

  void updateNumber(int index) {
    selectedDropdown = index;
    notifyListeners();
  }

  Future<void> getAllTitles() async {
    List<Titles> response = await userService.getTitles();

    this.titles = response.map((json) => TitleViewModel(title: json)).toList();

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<Message> registerUser(User user, Profile profile, String token)  async {

    setState(ViewState.Processing);
    notifyListeners();

    Message response = await userService.registerUser(user, profile, token);

    setState(ViewState.Completed);
    notifyListeners();

    return response;

  }
}

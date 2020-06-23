import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/page.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/page_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  PageService pageService = locator<PageService>();

  User user;
  Page page;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updatePageInfo();
    notifyListeners();
  }

  Future<void> _updatePageInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);
    page = await pageService.getActivePage(1);

    setState(ViewState.Completed);
    notifyListeners();
  }
}

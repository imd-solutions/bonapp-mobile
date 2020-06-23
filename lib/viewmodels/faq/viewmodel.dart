import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/faq.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/faq_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaqViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  FaqService faqService = locator<FaqService>();

  User user;
  List<Faq> allFaqs;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updateFaqInfo();
    notifyListeners();
  }

  Future<void> _updateFaqInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);
    allFaqs = await faqService.getActiveFAQ();

    setState(ViewState.Completed);
    notifyListeners();
  }
}

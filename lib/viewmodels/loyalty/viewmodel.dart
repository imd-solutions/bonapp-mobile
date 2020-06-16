import 'package:flutter_bonapp/viewmodels/base_model.dart';

class LoyaltyViewModel extends BaseModel {
  String initial = 'drinks';

  void initialise() {}

  void selectPage(String page) {
    initial = page;
    notifyListeners();
  }
}

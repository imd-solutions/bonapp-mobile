import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  CartService _cartService = locator<CartService>();

  User user;

  void initialise() {
    setState(ViewState.Busy);
    _updatePageInfo();
    notifyListeners();
  }

  Future<void> _updatePageInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);

    setState(ViewState.Completed);
    notifyListeners();
  }

  int get cartItemCount => _cartService.itemCount;
  int getItemCount() {
    return 0;
  }

  int itemAmount(id) {
    return _cartService.itemAmount(id);
  }

  void addItemToCart(int pid, String name, String subtitle, double price) {
    _cartService.addItem(pid, name, subtitle, price);
    notifyListeners();
  }

  void removeSingleItemFromCart(int pid) {
    _cartService.removeSingleItem(pid);
    notifyListeners();
  }
}

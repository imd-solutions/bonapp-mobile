import 'package:flutter_bonapp/models/cart.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewModel extends BaseModel {
  CartService _cartService = locator<CartService>();
  UserService _userService = locator<UserService>();

  void initialise() {
    getUserInfo();
  }

  Map<String, CartItem> get items => _cartService.items;

  int get itemCount => _cartService.itemCount;

  User user;

  void clearCartItems() {
    _cartService.clear();
    notifyListeners();
  }

  Future<User> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    user = await _userService.getUser(id);
    notifyListeners();
    return user;
  }
}

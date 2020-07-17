import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  MenuService menuService = locator<MenuService>();
  CartService _cartService = locator<CartService>();

  List<Items> categoryItems = [];

  User user;

  void initialise(int cid) {
    setState(ViewState.Busy);
    _updatePageInfo();
    getItemsCategory(cid);
    notifyListeners();
  }

  Future<void> _updatePageInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<void> getItemsCategory(int cid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    setState(ViewState.Busy);
    notifyListeners();

    categoryItems = await menuService.getItemsCategory(id, cid);

    setState(ViewState.Completed);

    notifyListeners();
  }

  Future<void> getItemSiteInfo(int pid) async {}

  int itemAmount(id) {
    return _cartService.itemAmount(id);
  }

  void addItemToCart(int pid, String name, String subtitle, double price) {
    _cartService.addItem(pid, name, subtitle, price);
    notifyListeners();
  }

  void removeItemFromCart(int id) {
    _cartService.removeSingleItem(id);
    notifyListeners();
  }
}

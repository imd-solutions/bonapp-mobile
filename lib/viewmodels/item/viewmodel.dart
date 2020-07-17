import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  MenuService menuService = locator<MenuService>();
  CartService _cartService = locator<CartService>();

  Items shopItem;

  User user;

  void initialise(int id) {
    setState(ViewState.Busy);
    getShopItem(id);
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

  Future<void> getShopItem(int pid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    setState(ViewState.Busy);
    notifyListeners();

    shopItem = await menuService.getMenuitemShop(id, pid);

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

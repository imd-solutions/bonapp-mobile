import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class CategoryViewModel extends BaseModel {
  CartService _cartService = locator<CartService>();
  
  void initialise() {
    
  }

  int itemAmount(id) {
    return _cartService.itemAmount(id);
  }

  void addItemToCart(int pid, String name, double price) {
    _cartService.addItem(pid, name, price);
    notifyListeners();
  }

  void removeItemFromCart(int id) {
    _cartService.removeSingleItem(id);
    notifyListeners();
  }

}
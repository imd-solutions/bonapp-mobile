import 'package:flutter_bonapp/models/cart.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class CartViewModel extends BaseModel {
  CartService _cartService = locator<CartService>();

  void initialise() {}

  Map<String, CartItem> get items => _cartService.items;

  int get itemCount => _cartService.itemCount;
}

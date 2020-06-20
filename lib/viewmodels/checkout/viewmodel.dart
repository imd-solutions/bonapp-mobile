import 'package:flutter_bonapp/models/cart.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class CheckoutViewModel extends BaseModel {
  CartService _cartService = locator<CartService>();

  Map<String, CartItem> get items => _cartService.items;

  double get cartSubTotal => _cartService.cartSubTotal;
  double get cartTax => _cartService.cartTax;
  double get cartTotal => _cartService.cartTotal;
  int get itemCount => _cartService.itemCount;


  void initialise() {}
}

import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/cart.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/stripe_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stripe_payment/stripe_payment.dart';

class CheckoutViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  CartService _cartService = locator<CartService>();
  StripeService stripeService = locator<StripeService>();

  User user;

  Map<String, CartItem> get items => _cartService.items;

  double get cartSubTotal => _cartService.cartSubTotal;
  double get cartTax => _cartService.cartTax;
  double get cartTotal => _cartService.cartTotal;
  int get itemCount => _cartService.itemCount;

  StripePayment stripePayment;

  void initialise() {
    _updateData();
  }

  Future<void> _updateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);
    // Register Stripe Payment.
    stripePayment = await stripeService.init();
  }

  Future<StripeTransactionResponse> payWithNewCard(int uid, String total, orderItems) async {
    setState(ViewState.Processing);
    notifyListeners();
    StripeTransactionResponse response = await stripeService.payWithNewCard(amount: total, currency: 'GBP', userId: uid, orderItems: orderItems);

    if (response.success == true) {
      _cartService.clear();
    }
    setState(ViewState.Completed);
    notifyListeners();
    return response;
  }
}

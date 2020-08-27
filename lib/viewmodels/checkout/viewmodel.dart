import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/cart.dart';
import 'package:flutter_bonapp/models/location.dart';
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

  int branchDropdown = 0;
  int deliveryDropdown = 0;

  User user;

  List<Delivery> deliveries;
  String specialInstructions;

  Map<String, CartItem> get items => _cartService.items;

  double get cartSubTotal => _cartService.cartSubTotal;
  double get cartTax => _cartService.cartTax;
  double get cartTotal => _cartService.cartTotal;
  int get itemCount => _cartService.itemCount;

  StripePayment stripePayment;

  void initialise() {
    setState(ViewState.Busy);
    _updateData();
    notifyListeners();
  }

  void updateBranchDropdown(int index) {
    branchDropdown = index;
    notifyListeners();
  }

  void updateDeliveryDropdown(int index) {
    deliveryDropdown = index;
    notifyListeners();
  }

  void updateSpecialInstructions(String instructions) {
    specialInstructions = instructions;
  }

  Future<void> _updateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);

    // Register Stripe Payment.
    stripePayment = await stripeService.init();
    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<void> getDeliveryTimes(int id) async {
    setState(ViewState.DoingSomething);
    deliveries = await userService.getDeliveries(id);
    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<StripeTransactionResponse> payWithNewCard(int uid, String total, orderItems, branch, delivery, instructions) async {
    setState(ViewState.Processing);
    notifyListeners();
    StripeTransactionResponse response = await stripeService.payWithNewCard(amount: total, currency: 'GBP', userId: uid, orderItems: orderItems, branch: branch, delivery: delivery, instructions: instructions);

    if (response.success == true) {
      _cartService.clear();
    }
    setState(ViewState.Completed);
    notifyListeners();
    return response;
  }
}

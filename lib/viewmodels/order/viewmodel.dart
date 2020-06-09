import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/order_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderViewModel extends BaseModel {
  OrderService orderService = locator<OrderService>();

  List<Order> userOrder;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updateOrderInfo();
    notifyListeners();
  }

  Future<void> _updateOrderInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    userOrder = await orderService.getAllUserOrders(uid);

    setState(ViewState.Completed);
    notifyListeners();
  }
}

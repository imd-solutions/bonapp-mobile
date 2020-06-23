import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/order_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  OrderService orderService = locator<OrderService>();

  User user;
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

    user = await userService.getUser(uid);
    userOrder = await orderService.getAllUserOrders(uid);

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<Message> sendOrderMessage(String oid, String message) async {
    setState(ViewState.Processing);
    notifyListeners();
    Message response = await orderService.sendOrderMessage(oid, message);
    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }

  Future<Message> orderReceived(int oid) async {
    setState(ViewState.Processing);
    notifyListeners();
    Message response = await orderService.orderReceived(oid);
    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }
}

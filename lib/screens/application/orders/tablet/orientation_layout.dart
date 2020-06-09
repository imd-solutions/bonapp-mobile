import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/order/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class OrderTabletPortrait extends BaseModelWidget<OrderViewModel> {
  @override
  Widget build(BuildContext context, OrderViewModel data) {
    return Container(
      child: Text('Order Page.'),
    );
  }
}

class OrderTabletLandscape extends BaseModelWidget<OrderViewModel> {
  @override
  Widget build(BuildContext context, OrderViewModel data) {
    return Container(
      child: Text('Order Page.'),
    );
  }
}

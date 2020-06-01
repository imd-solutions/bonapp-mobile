import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/cart/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class CartTabletPortrait extends BaseModelWidget<CartViewModel> {
  @override
  Widget build(BuildContext context, CartViewModel data) {
    return Container(
      child: Text('Cart Page.'),
    );
  }
}

class CartTabletLandscape extends BaseModelWidget<CartViewModel> {
  @override
  Widget build(BuildContext context, CartViewModel data) {
    return Container(
      child: Text('Cart Page.'),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/checkout/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class CheckoutTabletPortrait extends BaseModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    return Container(
      child: const Text('Checkout Page.'),
    );
  }
}

class CheckoutTabletLandscape extends BaseModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    return Container(
      child: const Text('Checkout Page.'),
    );
  }
}

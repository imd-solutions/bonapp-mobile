import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/loyalty/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class LoyaltyTabletPortrait extends BaseModelWidget<LoyaltyViewModel> {
  @override
  Widget build(BuildContext context, LoyaltyViewModel data) {
    return Center(
      child: const Text('Loyalty Page'),
    );
  }
}

class LoyaltyTabletLandscape extends BaseModelWidget<LoyaltyViewModel> {
  @override
  Widget build(BuildContext context, LoyaltyViewModel data) {
    return Center(
      child: const Text('Loyalty Page'),
    );
  }
}

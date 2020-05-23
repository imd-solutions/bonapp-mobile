import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/reward/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class RewardMobilePortrait extends BaseModelWidget<RewardViewModel> {
  @override
  Widget build(BuildContext context, RewardViewModel data) {
    return Center(
      child: Text('Rewards Page'),
    );
  }
}

class RewardMobileLandscape extends BaseModelWidget<RewardViewModel> {
  @override
  Widget build(BuildContext context, RewardViewModel data) {
    return Center(
      child: Text('Rewards Page'),
    );
  }
}

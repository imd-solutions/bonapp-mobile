import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/reward/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class RewardTabletPortrait extends BaseModelWidget<RewardViewModel> {

  @override
  Widget build(BuildContext context, RewardViewModel data) {

    return Scaffold(
      body: Center(
        child: const Text('Reward Page'),
      ),
    );
  }
}

class RewardTabletLandscape extends BaseModelWidget<RewardViewModel> {

  @override
  Widget build(BuildContext context, RewardViewModel data) {
    return Scaffold(
      body: Center(
        child: const Text('Reward Page'),
      ),
    );
  }
}

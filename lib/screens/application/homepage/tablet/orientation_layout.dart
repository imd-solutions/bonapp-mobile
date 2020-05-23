import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/home/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class HomeTabletPortrait extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return Center(
      child: Text('HomePage'),
    );
  }
}

class HomeTabletLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return Center(
      child: Text('HomePage'),
    );
  }
}

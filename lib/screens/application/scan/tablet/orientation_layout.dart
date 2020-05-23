import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/scan/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class ScanTabletPortrait extends BaseModelWidget<ScanViewModel> {

  @override
  Widget build(BuildContext context, ScanViewModel data) {
    return Center(
      child: Text('Scan Page'),
    );
  }
}

class ScanTabletLandscape extends BaseModelWidget<ScanViewModel> {

  @override
  Widget build(BuildContext context, ScanViewModel data) {
    return Center(
      child: Text('Scan Page'),
    );
  }
}

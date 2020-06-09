import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/faq/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class FaqTabletPortrait extends BaseModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel data) {
    return Container(
      child: Text('Faq Page.'),
    );
  }
}

class FaqTabletLandscape extends BaseModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel data) {
    return Container(
      child: Text('Faq Page.'),
    );
  }
}

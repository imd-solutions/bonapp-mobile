import 'package:flutter/material.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/viewmodels/faq/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class FaqMobilePortrait extends BaseModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ApplicationHeader(user: data.user),
            Center(
              child: Text('Faq Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqMobileLandscape extends BaseModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ApplicationHeader(user: data.user),
            Center(
              child: Text('Faq Page'),
            )
          ],
        ),
      ),
    );
  }
}

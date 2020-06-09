import 'package:flutter/material.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/viewmodels/settings/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class SettingsMobilePortrait extends BaseModelWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ApplicationHeader(),
            Center(
              child: Text(data.emailAlert.toString()),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsMobileLandscape extends BaseModelWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ApplicationHeader(),
            Center(
              child: Text('Settings Page'),
            )
          ],
        ),
      ),
    );
  }
}

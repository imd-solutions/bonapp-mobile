import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/settings/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class SettingsMobilePortrait extends BaseModelWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 50.0,
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.settings),
                )
              ],
            ),
            Center(
              child: Text(data.emailAlert.toString()),
            )
          ],
//          child: Text('Settings Page'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 50.0,
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.settings),
                )
              ],
            ),
            Center(
              child: Text('Settings Page'),
            )
          ],
//          child: Text('Settings Page'),
        ),
      ),
    );
  }
}

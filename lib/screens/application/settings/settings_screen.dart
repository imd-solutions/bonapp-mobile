import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/settings/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/settings/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => SettingsMobilePortrait(),
            landscape: (context) => SettingsMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => SettingsMobilePortrait(),
            landscape: (context) => SettingsMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

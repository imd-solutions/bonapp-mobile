import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/manager/dashboard/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/dashboard/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class DashboardScreen extends StatelessWidget {
  final User user;
  final String information;

  DashboardScreen({this.user, this.information});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<DashboardViewModel>(
        viewModel: DashboardViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => DashboardMobilePortrait(user: user, information: information),
            landscape: (context) => DashboardMobileLandscape(user: user, information: information),
          ),
          tablet: OrientationLayout(
            portrait: (context) => DashboardMobilePortrait(user: user, information: information),
            landscape: (context) => DashboardMobileLandscape(user: user, information: information),
          ),
        ),
      ),
    );
  }
}

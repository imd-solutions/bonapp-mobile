import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/initial/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/initial/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class InitialScreen extends StatelessWidget {
  final User user;

  InitialScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<InitialViewModel>(
        viewModel: InitialViewModel(),
        onModelReady: (model) => model.initialise(user.id.toInt()),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => InitialMobilePortrait(
              user: user,
            ),
            landscape: (context) => InitialMobileLandscape(
              user: user,
            ),
          ),
          tablet: OrientationLayout(
            portrait: (context) => InitialMobilePortrait(),
            landscape: (context) => InitialMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

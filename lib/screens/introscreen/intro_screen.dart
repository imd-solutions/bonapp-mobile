import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/introscreen/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/introscreen/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<IntroScreenViewModel>(
        viewModel: IntroScreenViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => IntroScreenMobilePortrait(),
            landscape: (context) => IntroScreenMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => IntroScreenMobilePortrait(),
            landscape: (context) => IntroScreenMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/reward/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/reward/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class RewardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<RewardViewModel>(
        viewModel: RewardViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => RewardMobilePortrait(),
            landscape: (context) => RewardMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => RewardMobilePortrait(),
            landscape: (context) => RewardMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

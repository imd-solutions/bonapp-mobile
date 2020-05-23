import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/loyalty/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/loyalty/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class LoyaltyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<LoyaltyViewModel>(
        viewModel: LoyaltyViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => LoyaltyMobilePortrait(),
            landscape: (context) => LoyaltyMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => LoyaltyMobilePortrait(),
            landscape: (context) => LoyaltyMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

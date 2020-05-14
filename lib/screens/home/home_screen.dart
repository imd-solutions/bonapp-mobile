import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/home/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/screens/home/tablet/view_layout.dart';
import 'package:flutter_bonapp/viewmodels/home/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => HomeMobilePortrait(),
            landscape: (context) => HomeMobileLandscape(),
          ),
          tablet: HomeTabletView(),
      ),
    );
  }
}

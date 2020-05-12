import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/responsive/orientation_layout.dart';
import 'package:flutter_resp_mvvm/responsive/screen_type_layout.dart';
import 'package:flutter_resp_mvvm/screens/home/mobile/orientation_layout.dart';
import 'package:flutter_resp_mvvm/screens/home/tablet/view_layout.dart';
import 'package:flutter_resp_mvvm/viewmodels/home/viewmodel.dart';
import 'package:flutter_resp_mvvm/widgets/base_widget.dart';

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

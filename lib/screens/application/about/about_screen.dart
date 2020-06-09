import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/about/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/about/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class AboutScreen extends StatelessWidget {
  final User user;

  AboutScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<AboutViewModel>(
        viewModel: AboutViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => AboutMobilePortrait(),
            landscape: (context) => AboutMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => AboutMobilePortrait(),
            landscape: (context) => AboutMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/faq/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/faq/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class FaqScreen extends StatelessWidget {
  final User user;

  FaqScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<FaqViewModel>(
        viewModel: FaqViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => FaqMobilePortrait(),
            landscape: (context) => FaqMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => FaqMobilePortrait(),
            landscape: (context) => FaqMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

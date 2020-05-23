import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/scan/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/scan/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class ScanScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<ScanViewModel>(
        viewModel: ScanViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => ScanMobilePortrait(),
            landscape: (context) => ScanMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => ScanMobilePortrait(),
            landscape: (context) => ScanMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

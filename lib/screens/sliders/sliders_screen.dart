import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/sliders/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/sliders/viewmodel.dart';
import 'package:flutter_bonapp/screens/sliders/tablet/view_layout.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class SlidersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SlidersViewModel>(
      viewModel: SlidersViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => SlidersMobilePortrait(),
          landscape: (context) => SlidersMobileLandscape(),
        ),
        tablet: SlidersTabletView(),
      ),
    );
  }
}

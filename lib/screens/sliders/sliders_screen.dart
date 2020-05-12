import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/responsive/orientation_layout.dart';
import 'package:flutter_resp_mvvm/responsive/screen_type_layout.dart';
import 'package:flutter_resp_mvvm/screens/sliders/mobile/orientation_layout.dart';
import 'package:flutter_resp_mvvm/viewmodels/sliders/viewmodel.dart';
import 'package:flutter_resp_mvvm/screens/sliders/tablet/view_layout.dart';
import 'package:flutter_resp_mvvm/widgets/base_widget.dart';

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

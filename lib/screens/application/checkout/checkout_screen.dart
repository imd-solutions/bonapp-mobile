import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/checkout/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/checkout/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class CheckoutScreen extends StatelessWidget {
  final User user;

  CheckoutScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<CheckoutViewModel>(
        viewModel: CheckoutViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => CheckoutMobilePortrait(),
            landscape: (context) => CheckoutMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => CheckoutMobilePortrait(),
            landscape: (context) => CheckoutMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

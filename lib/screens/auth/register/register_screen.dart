import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/auth/register/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/register/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => RegisterMobilePortrait(),
          landscape: (context) => RegisterMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => RegisterMobilePortrait(),
          landscape: (context) => RegisterMobileLandscape(),
        ),
      ),
    );
  }
}

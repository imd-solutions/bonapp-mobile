import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/auth/login/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/login/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobileLandscape(),
        ),
      ),
    );
  }
}

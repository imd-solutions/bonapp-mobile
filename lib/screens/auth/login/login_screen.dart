import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/responsive/orientation_layout.dart';
import 'package:flutter_resp_mvvm/responsive/screen_type_layout.dart';
import 'package:flutter_resp_mvvm/screens/auth/login/mobile/orientation_layout.dart';
import 'package:flutter_resp_mvvm/viewmodels/login/viewmodel.dart';
import 'package:flutter_resp_mvvm/widgets/base_widget.dart';

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

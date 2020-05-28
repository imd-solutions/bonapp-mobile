import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/account/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/account/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class AccountScreen extends StatelessWidget {
  final User user;

  AccountScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<AccountViewModel>(
        viewModel: AccountViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => AccountMobilePortrait(user: user),
            landscape: (context) => AccountMobileLandscape(user: user),
          ),
          tablet: OrientationLayout(
            portrait: (context) => AccountMobilePortrait(),
            landscape: (context) => AccountMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

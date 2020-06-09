import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/messages/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class MessagesScreen extends StatelessWidget {
  final User user;

  MessagesScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<MessagesViewModel>(
        viewModel: MessagesViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => MessagesMobilePortrait(),
            landscape: (context) => MessagesMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => MessagesMobilePortrait(),
            landscape: (context) => MessagesMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

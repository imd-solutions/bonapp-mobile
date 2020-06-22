import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/messages/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class MessagesScreen extends StatelessWidget {
  final String message;

  MessagesScreen({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<MessagesViewModel>(
        viewModel: MessagesViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => MessagesMobilePortrait(message: message),
            landscape: (context) => MessagesMobileLandscape(message: message),
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

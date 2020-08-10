import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/message/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class MessageScreen extends StatelessWidget {
  final Messages message;
  final String route;

  MessageScreen({this.message, this.route});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<MessageViewModel>(
        viewModel: MessageViewModel(),
        onModelReady: (model) => model.initialise(message.id),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => MessageMobilePortrait(message: message, route: route),
            landscape: (context) => MessageMobileLandscape(message: message, route: route),
          ),
          tablet: OrientationLayout(
            portrait: (context) => MessageMobilePortrait(message: message, route: route),
            landscape: (context) => MessageMobileLandscape(message: message, route: route),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class MessageTabletPortrait extends BaseModelWidget<MessageViewModel> {
  @override
  Widget build(BuildContext context, MessageViewModel data) {
    return Container(
      child: Text('Message Page.'),
    );
  }
}

class MessageTabletLandscape extends BaseModelWidget<MessageViewModel> {
  @override
  Widget build(BuildContext context, MessageViewModel data) {
    return Container(
      child: Text('Message Page.'),
    );
  }
}

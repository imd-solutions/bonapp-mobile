import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class MessagesTabletPortrait extends BaseModelWidget<MessagesViewModel> {
  @override
  Widget build(BuildContext context, MessagesViewModel data) {
    return Container(
      child: Text('Messages Page.'),
    );
  }
}

class MessagesTabletLandscape extends BaseModelWidget<MessagesViewModel> {
  @override
  Widget build(BuildContext context, MessagesViewModel data) {
    return Container(
      child: Text('Messages Page.'),
    );
  }
}

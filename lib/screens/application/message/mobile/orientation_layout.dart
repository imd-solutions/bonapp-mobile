import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

class MessageMobilePortrait extends BaseModelWidget<MessageViewModel> {
  final Messages message;
  MessageMobilePortrait({this.message});
  @override
  Widget build(BuildContext context, MessageViewModel data) {
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ApplicationHeader(),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title:',
                      style: TextStyle(
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      '${message.title}',
                      style: TextStyle(
                        fontFamily: secondaryFont,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Body:',
                      style: TextStyle(
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      '${message.body}',
                      style: TextStyle(
                        fontFamily: secondaryFont,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              MessageBtns(
                message: message,
                data: data,
                context: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageMobileLandscape extends BaseModelWidget<MessageViewModel> {
  final Messages message;
  MessageMobileLandscape({this.message});
  @override
  Widget build(BuildContext context, MessageViewModel data) {
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              ApplicationHeader(),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title:',
                      style: TextStyle(
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      '${message.title}',
                      style: TextStyle(
                        fontFamily: secondaryFont,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Body:',
                      style: TextStyle(
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      '${message.body}',
                      style: TextStyle(
                        fontFamily: secondaryFont,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              MessageBtns(
                message: message,
                data: data,
                context: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBtns extends StatelessWidget {
  final Messages message;
  final MessageViewModel data;
  final BuildContext context;

  const MessageBtns({Key key, @required this.message, this.data, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
          onPressed: () => print('Reply'),
          child: Text(
            'Reply',
            style: TextStyle(
              color: Color(secondaryColour),
              fontSize: 20.0,
              fontFamily: secondaryFont,
            ),
          ),
        ),
        Spacer(),
        RaisedButton(
          color: Color(primaryColour),
          onPressed: () => _processMessageDelete(message.id, data, context),
          child: data.state == ViewState.Processing
              ? SizedBox(
                  height: 15.0,
                  width: 15.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(whiteColour),
                    ),
                  ),
                )
              : Text(
                  'Delete',
                  style: TextStyle(
                    color: Color(whiteColour),
                    fontSize: 20.0,
                    fontFamily: secondaryFont,
                  ),
                ),
        )
      ],
    );
  }
}

void _processMessageDelete(int id, MessageViewModel data, BuildContext context) {
  data.deleteMessage(id).then(
    (message) {
      print('This is the message: $message');
      // Alert message to the user.
      _snackBar(message, context);
    },
  );
}

void _snackBar(Message message, BuildContext context) {
  Flushbar(
    title: message.title,
    message: message.message.replaceAll('[', '').replaceAll(']', ''),
    backgroundColor: Color(message.colour),
    duration: Duration(seconds: message.status != 200 ? 7 : 3),
  )..show(context).then(
      (_) {
        // Send the user to the Message Screen on success.
        if (message.status == 200) {
          Navigator.of(context).pushNamedAndRemoveUntil(MessagesScreenRoute, (Route<dynamic> route) => false, arguments: 'messageDeleted');
        }
      },
    );
}

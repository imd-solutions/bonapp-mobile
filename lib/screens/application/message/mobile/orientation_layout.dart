import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
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
              Row(
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
                    onPressed: () => data.deleteMessage(message.id),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Color(whiteColour),
                        fontSize: 20.0,
                        fontFamily: secondaryFont,
                      ),
                    ),
                  )
                ],
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
              Row(
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
                    onPressed: () => data.deleteMessage(message.id),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Color(whiteColour),
                        fontSize: 20.0,
                        fontFamily: secondaryFont,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

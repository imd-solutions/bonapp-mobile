import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

class MessagesMobilePortrait extends BaseModelWidget<MessagesViewModel> {
  final String message;
  MessagesMobilePortrait({this.message});

  @override
  Widget build(BuildContext context, MessagesViewModel data) {
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              ApplicationHeader(user: data.user, message: message),
              SizedBox(
                height: 20.0,
              ),
              if (data.state != ViewState.Busy)
                Expanded(
                  child: data.userMessages.length < 1
                      ? Text('You do not have any messages.')
                      : ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                data.userMessages[index].title,
                                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont),
                              ),
                              isThreeLine: true,
                              leading: MessageReadAvatar(data.userMessages[index]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data.userMessages[index].body.length > 30 ? '${data.userMessages[index].body.substring(0, 30)}...' : data.userMessages[index].body,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      RaisedButton(
                                        color: Color(secondaryColour),
                                        onPressed: () => _navigateToMessage(context: context, message: data.userMessages[index]),
                                        child: Text(
                                          'Read',
                                          style: TextStyle(
                                            color: Color(whiteColour),
                                            fontFamily: secondaryFont,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      RaisedButton(
                                        color: Color(redColour),
                                        onPressed: () => data.deleteMessage(data.userMessages[index].id),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Color(whiteColour),
                                            fontFamily: secondaryFont,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => Divider(),
                          itemCount: data.userMessages.length),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesMobileLandscape extends BaseModelWidget<MessagesViewModel> {

  final String message;
  MessagesMobileLandscape({this.message});

  @override
  Widget build(BuildContext context, MessagesViewModel data) {
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              ApplicationHeader(user: data.user, message: message),
              SizedBox(
                height: 20.0,
              ),
              if (data.state != ViewState.Busy)
                Expanded(
                  child: data.userMessages.length < 1
                      ? Text('You do not have any messages.')
                      : ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      data.userMessages[index].title,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont),
                                    ),
                                    isThreeLine: true,
                                    leading: MessageReadAvatar(data.userMessages[index]),
                                    subtitle: Text(
                                      data.userMessages[index].body.length > 30 ? '${data.userMessages[index].body.substring(0, 30)}...' : data.userMessages[index].body,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Color(secondaryColour),
                                      onPressed: () => _navigateToMessage(context: context, message: data.userMessages[index]),
                                      child: Text(
                                        'Read',
                                        style: TextStyle(
                                          color: Color(whiteColour),
                                          fontFamily: secondaryFont,
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Color(redColour),
                                      onPressed: () => data.deleteMessage(data.userMessages[index].id),
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Color(whiteColour),
                                          fontFamily: secondaryFont,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => Divider(),
                          itemCount: data.userMessages.length),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageReadAvatar extends StatelessWidget {
  final Messages message;
  MessageReadAvatar(this.message);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: message.read == 'No' ? Color(primaryColour) : Color(accentThirdColour),
      child: Text(
        'BA',
        style: TextStyle(color: Color(whiteColour)),
      ),
    );
  }
}

_navigateToMessage({context, message}) {
  Navigator.pushNamed(context, MessageScreenRoute, arguments: message);
}

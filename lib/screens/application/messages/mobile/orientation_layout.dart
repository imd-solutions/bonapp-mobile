import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/messages/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

class MessagesMobilePortrait extends BaseModelWidget<MessagesViewModel> {
  @override
  Widget build(BuildContext context, MessagesViewModel data) {
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
              if (data.state != ViewState.Busy)
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            data.userMessages[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont),
                          ),
                          isThreeLine: true,
                          leading: CircleAvatar(
                            backgroundColor: Color(primaryColour),
                            child: Text(
                              'BA',
                              style: TextStyle(color: Color(whiteColour)),
                            ),
                          ),
                          subtitle: Text(
                            '${data.userMessages[index].body.substring(0, 15)}...',
                          ),
                          trailing: data.userMessages[index].read == 'No'
                              ? RaisedButton(
                                  color: Color(secondaryColour),
                                  onPressed: () => print('READ'),
                                  child: Text(
                                    'Read',
                                    style: TextStyle(color: Color(whiteColour)),
                                  ),
                                )
                              : Text(''),
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
  @override
  Widget build(BuildContext context, MessagesViewModel data) {
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
              if (data.state != ViewState.Busy)
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            data.userMessages[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont),
                          ),
                          isThreeLine: true,
                          leading: CircleAvatar(
                            backgroundColor: Color(primaryColour),
                            child: Text(
                              'BA',
                              style: TextStyle(color: Color(whiteColour)),
                            ),
                          ),
                          subtitle: Text(
                            '${data.userMessages[index].body.substring(0, 15)}...',
                          ),
                          trailing: data.userMessages[index].read == 'No'
                              ? RaisedButton(
                                  color: Color(secondaryColour),
                                  onPressed: () => print('READ'),
                                  child: Text(
                                    'Read',
                                    style: TextStyle(color: Color(whiteColour)),
                                  ),
                                )
                              : Text(''),
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

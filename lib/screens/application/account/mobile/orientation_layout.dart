import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/account/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

List cards = [
  {"icon": Icons.work, "text": "Profession", "divider": true},
  {"icon": Icons.flag, "text": "Nationality", "divider": true},
  {"icon": Icons.location_on, "text": "Site", "divider": false},
];
List switchers = [
  {"icon": Icons.mail_outline, "text": "Email Notification", "divider": true},
  {"icon": Icons.notifications, "text": "App Notification", "divider": true},
  {"icon": Icons.phone_android, "text": "Text Notification", "divider": false},
];

class AccountMobilePortrait extends BaseModelWidget<AccountViewModel> {
  final User user;

  AccountMobilePortrait({this.user});

  final bool turnOnNotification = true;

  @override
  Widget build(BuildContext context, AccountViewModel data) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        height: 35.0,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => print('Alert Bar'),
                    icon: Icon(Icons.shopping_cart),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              boxShadow: [
                                BoxShadow(blurRadius: 3.0, offset: Offset(0, 4.0), color: Colors.black38),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/logo.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                user.name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                user.email,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              SmallButton(btnText: "Edit"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              for (var i = 0; i < cards.length; i++)
                                BuildAccountList(
                                  icon: cards[i]['icon'],
                                  text: cards[i]['text'],
                                  divider: cards[i]['divider'],
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              for (var i = 0; i < switchers.length; i++)
                                BuildNotificationList(
                                  icon: switchers[i]['icon'],
                                  text: switchers[i]['text'],
                                  divider: switchers[i]['divider'],
                                  turnOnNotification: turnOnNotification,
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountMobileLandscape extends BaseModelWidget<AccountViewModel> {
  final User user;

  AccountMobileLandscape({this.user});
  @override
  Widget build(BuildContext context, AccountViewModel data) {
    return Container(
      child: Text('Account Page.'),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String btnText;

  SmallButton({this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(primaryColour),
          ),
          borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(color: Color(primaryColour), fontSize: 16.0),
        ),
      ),
    );
  }
}

class BuildNotificationList extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool divider;
  final bool turnOnNotification;

  BuildNotificationList({this.icon, this.text, this.divider, this.turnOnNotification});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              icon,
              color: Color(secondaryColour),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Switch(
              value: turnOnNotification,
              onChanged: (bool value) {},
            ),
          ],
        ),
        if (divider)
          Divider(
            height: 10.0,
            color: Colors.grey,
          ),
      ],
    );
  }
}

class BuildAccountList extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool divider;

  BuildAccountList({this.icon, this.text, this.divider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                color: Color(secondaryColour),
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15.0, fontFamily: secondaryFont),
              ),
              Spacer(),
              Icon(
                Icons.create,
                color: Color(accentSecondColour),
                size: 15.0,
              ),
            ],
          ),
          if (divider)
            Divider(
              height: 15.0,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}

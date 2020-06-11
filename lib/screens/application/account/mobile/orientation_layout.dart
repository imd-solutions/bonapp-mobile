import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/account/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

final bool turnOnNotification = true;

List switchers = [
  {"icon": Icons.mail_outline, "text": "Email Notification", "divider": true},
  {"icon": Icons.notifications, "text": "App Notification", "divider": true},
  {"icon": Icons.phone_android, "text": "Text Notification", "divider": false},
];

class AccountMobilePortrait extends BaseModelWidget<AccountViewModel> {
  final User user;

  AccountMobilePortrait({this.user});

  @override
  Widget build(BuildContext context, AccountViewModel data) {
    List cards = [
      {"icon": Icons.work, "text": "Profession", "divider": true, "data": data.professions},
      {"icon": Icons.flag, "text": "Nationality", "divider": true, "data": data.nationality},
      {"icon": Icons.location_on, "text": "Site", "divider": false, "data": data.locations},
    ];

    return Scaffold(
      backgroundColor: Color(whiteColour),
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                ApplicationHeader(),
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
                                  BoxShadow(blurRadius: 3.0, offset: Offset(0, 4.0), color: Color(blackColour)),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(graphQLApiImg + user.avatar),
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
                                  style: TextStyle(color: Color(greyColour)),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SmallButton(
                                  btnText: "Edit",
                                  user: user,
                                ),
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
                            fontFamily: primaryFont,
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
                                    user: user,
                                    data: cards[i]['data'],
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
                            fontFamily: primaryFont,
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
      ),
    );
  }
}

class AccountMobileLandscape extends BaseModelWidget<AccountViewModel> {
  final User user;

  AccountMobileLandscape({this.user});
  @override
  Widget build(BuildContext context, AccountViewModel data) {
    List cards = [
      {"icon": Icons.work, "text": "Profession", "divider": true, "data": data.professions},
      {"icon": Icons.flag, "text": "Nationality", "divider": true, "data": data.nationality},
      {"icon": Icons.location_on, "text": "Site", "divider": false, "data": data.locations},
    ];

    return Scaffold(
      backgroundColor: Color(whiteColour),
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                ApplicationHeader(),
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
                                  BoxShadow(blurRadius: 3.0, offset: Offset(0, 4.0), color: Color(blackColour)),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(graphQLApiImg + user.avatar),
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
                                  style: TextStyle(color: Color(greyColour)),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SmallButton(btnText: "Edit", user: user),
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
                            fontFamily: primaryFont,
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
                                    user: user,
                                    data: cards[i]['data'],
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
                            fontFamily: primaryFont,
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
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String btnText;
  final User user;

  SmallButton({this.btnText, this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showEditUser(context, user),
      child: Container(
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
            color: Color(greyColour),
          ),
      ],
    );
  }
}

class BuildAccountList extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool divider;
  final User user;
  final dynamic data;

  BuildAccountList({this.icon, this.text, this.divider, this.user, this.data});

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
              InkWell(
//                onTap: () => print(data[0].id),
                onTap: () => _showEditAccount(context, user, data),
                child: Icon(
                  Icons.create,
                  color: Color(accentSecondColour),
                  size: 15.0,
                ),
              ),
            ],
          ),
          if (divider)
            Divider(
              height: 15.0,
              color: Color(greyColour),
            ),
        ],
      ),
    );
  }
}

Widget getTextField(String inputBoxName, String inputHintBox, TextEditingController inputBoxController) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: TextFormField(
      controller: inputBoxController,
      decoration: InputDecoration(
        hintText: inputHintBox,
        labelText: inputBoxName,
      ),
    ),
  );
}

Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
  return Container(
    margin: margin,
    padding: EdgeInsets.all(8.0),
    alignment: FractionalOffset.center,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF28324E)),
      borderRadius: BorderRadius.all(const Radius.circular(6.0)),
    ),
    child: Text(
      buttonLabel,
      style: TextStyle(
        color: const Color(0xFF28324E),
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.3,
      ),
    ),
  );
}

void _showEditUser(BuildContext context, User user) {
  final teFirstName = TextEditingController();
  final teLastName = TextEditingController();
  final teEmail = TextEditingController();
  final teMobile = TextEditingController();

  if (user != null) {
    teFirstName.text = user.profile.firstname;
    teLastName.text = user.profile.lastname;
    teEmail.text = user.email;
    teMobile.text = user.profile.mobileNumber;
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit detail'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTextField("Firstname", 'Your firstname', teFirstName),
              getTextField("Surname", 'Your firstname', teLastName),
              getTextField("Email", 'Your email address', teEmail),
              getTextField("Mobile", 'Your mobile phone number', teMobile),
              GestureDetector(
                onTap: () => print(teFirstName.text),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: getAppBorderButton(
                    "Edit",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showEditAccount(BuildContext context, User user, data) {
  List<DropdownMenuItem<int>> items = [];

  void _changedDropDownItem(int selected) {
//    updateSelected(selected);
  }

  // Additional select items.
  for (dynamic d in data) {
    items.add(
      new DropdownMenuItem(
        value: int.parse(d.id),
        child: Text(
          d.name,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }

  var alert = new AlertDialog(
    title: Text("Edit"),
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        DropdownButton<int>(
          hint: new Text(
            'Select',
            style: TextStyle(fontFamily: "Gotham"),
          ),
          items: items,
          onChanged: (int index) {},
          // value: selectedPurpose,
        )
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () => debugPrint("Save button"),
        child: Text('Save'),
      ),
      FlatButton(
        onPressed: () => Navigator.pop(context),
        child: Text('Cancel'),
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (_) {
        return alert;
      });
}

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/account/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

class AccountMobilePortrait extends BaseModelWidget<AccountViewModel> {
  final User user;

  AccountMobilePortrait({this.user});

  @override
  Widget build(BuildContext context, AccountViewModel data) {
    List cards = [
      {
        "icon": Icons.work,
        "text": "Profession",
        "divider": true,
        "account": data.professions,
        "selected": data.selectedProfession,
        "selectedName": data.selectedProfessionName,
        "profile": user.profile.profession,
        "data": data
      },
      {
        "icon": Icons.flag,
        "text": "Nationality",
        "divider": true,
        "account": data.nationality,
        "selected": data.selectedNationality,
        "selectedName": data.selectedNationalityName,
        "profile": user.profile.nationality,
        "data": data
      },
      {
        "icon": Icons.location_on,
        "text": "Site",
        "divider": false,
        "account": data.locations,
        "selected": data.selectedLocation,
        "selectedName": data.selectedLocationName,
        "profile": user.profile.location,
        "data": data
      },
    ];

    List switchers = [
      {"icon": Icons.mail_outline, "text": "Email Notification", "divider": true, "type": "email", "alert": data.emailNotification},
      {"icon": Icons.notifications, "text": "App Notification", "divider": true, "type": "app", "alert": data.appNotification},
      {"icon": Icons.phone_android, "text": "Text Notification", "divider": false, "type": "text", "alert": data.textNotification},
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
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(0, 4.0),
                                    color: Color(blackColour),
                                  ),
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
                                  style: TextStyle(
                                    color: Color(greyColour),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    SmallButton(
                                      btnText: "Edit",
                                      onTap: _showEditUser,
                                      data: data,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    SmallButton(
                                      btnText: "Save",
                                      onTap: _processUserUpdate,
                                      data: data,
                                    ),
                                  ],
                                )
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
                                    user: cards[i]['profile'],
                                    account: cards[i]['account'],
                                    selected: cards[i]['selected'],
                                    selectedName: cards[i]['selectedName'],
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
                                    type: switchers[i]['type'],
                                    divider: switchers[i]['divider'],
                                    turnOnNotification: switchers[i]['alert'],
                                    data: data,
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
      {
        "icon": Icons.work,
        "text": "Profession",
        "divider": true,
        "account": data.professions,
        "selected": data.selectedProfession,
        "selectedName": data.selectedProfessionName,
        "profile": user.profile.profession,
        "data": data
      },
      {
        "icon": Icons.flag,
        "text": "Nationality",
        "divider": true,
        "account": data.nationality,
        "selected": data.selectedNationality,
        "selectedName": data.selectedNationalityName,
        "profile": user.profile.nationality,
        "data": data
      },
      {
        "icon": Icons.location_on,
        "text": "Site",
        "divider": false,
        "account": data.locations,
        "selected": data.selectedLocation,
        "selectedName": data.selectedLocationName,
        "profile": user.profile.location,
        "data": data
      },
    ];

    List switchers = [
      {"icon": Icons.mail_outline, "text": "Email Notification", "divider": true, "type": "email", "alert": data.emailNotification},
      {"icon": Icons.notifications, "text": "App Notification", "divider": true, "type": "app", "alert": data.appNotification},
      {"icon": Icons.phone_android, "text": "Text Notification", "divider": false, "type": "text", "alert": data.textNotification},
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
                                Row(
                                  children: <Widget>[
                                    SmallButton(
                                      btnText: "Edit",
                                      onTap: _showEditUser,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    SmallButton(
                                      btnText: "Save",
                                      onTap: _showEditUser,
                                    ),
                                  ],
                                )
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
                                    user: cards[i]['profile'],
                                    account: cards[i]['account'],
                                    selected: cards[i]['selected'],
                                    selectedName: cards[i]['selectedName'],
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
                                    type: switchers[i]['type'],
                                    divider: switchers[i]['divider'],
                                    turnOnNotification: switchers[i]['alert'],
                                    data: data,
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
  final Function onTap;
  final AccountViewModel data;

  SmallButton({this.btnText, this.user, this.onTap, this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context, user, data),
      child: Container(
        height: 25.0,
        width: 60.0,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(primaryColour),
            ),
            borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: data.state == ViewState.Processing && btnText == 'Save'
              ? SizedBox(
                  height: 10.0,
                  width: 10.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(primaryColour),
                    ),
                  ),
                )
              : Text(
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
  final String type;
  final bool divider;
  final bool turnOnNotification;
  final AccountViewModel data;

  BuildNotificationList({this.icon, this.text, this.type, this.divider, this.turnOnNotification, this.data});

  void _updateNotification(String type, bool value) {
    data.updateNotification(type, value);
  }

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
              onChanged: (bool value) {
                _updateNotification(type, value);
              },
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
  final dynamic user;
  final dynamic account;
  final int selected;
  final String selectedName;
  final AccountViewModel data;

  BuildAccountList({this.icon, this.text, this.divider, this.user, this.account, this.selected, this.selectedName, this.data});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(fontSize: 15.0, fontFamily: secondaryFont, fontWeight: FontWeight.bold),
                  ),
                  Text(selectedName,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: secondaryFont,
                      )),
                ],
              ),
              Spacer(),
              InkWell(
//                onTap: () => print(data[0].id),
                onTap: () => _showEditAccount(context, user, account, text, selected, selectedName, data),
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

void _showEditUser(BuildContext context, User user, AccountViewModel data) {
  final teFirstName = TextEditingController();
  final teLastName = TextEditingController();
  final teEmail = TextEditingController();
  final teMobile = TextEditingController();

  if (data.user != null) {
    teFirstName.text = data.user.profile.firstname;
    teLastName.text = data.user.profile.lastname;
    teEmail.text = data.user.email;
    teMobile.text = data.user.profile.mobileNumber;
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
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Container(
                      height: 25.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(primaryColour),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(primaryColour),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      _updateUserInfo(teFirstName.text, teLastName.text, teEmail.text, teMobile.text, data);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 25.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(primaryColour),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Color(primaryColour),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void _showEditAccount(BuildContext context, dynamic user, account, String title, int selected, String selectedName, AccountViewModel data) {
  List<DropdownMenuItem<int>> items = [];

  void _changedDropDownItem(String type, int index, String name) {
    data.updateSelected(type, index, name);
  }

  items.add(
    new DropdownMenuItem(
      value: selected,
      child: Text(
        selectedName,
        style: TextStyle(
          fontSize: 9.0,
        ),
      ),
    ),
  );

  // Additional select items.
  for (dynamic d in account) {
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
    title: Text("Edit $title"),
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        DropdownButton<int>(
          hint: Text(
            selectedName,
            style: TextStyle(fontFamily: "Gotham"),
          ),
          items: items,
          onChanged: (int index) {
            var idx = index - 1;
            _changedDropDownItem(title, idx, account[idx].name);
            Navigator.pop(context);
          },
        )
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Cancel',
          style: TextStyle(
            color: Color(primaryColour),
          ),
        ),
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (_) {
        return alert;
      });
}

void _updateUserInfo(String firstname, String lastname, String email, String mobile, AccountViewModel data) {
  data.updateUserDetails(firstname, lastname, email, mobile);
}

void _processUserUpdate(BuildContext context, User user, AccountViewModel data) {
  data.saveUserDetails().then((message) => {
        Flushbar(
          title: message.title,
          message: message.message.replaceAll('Exception: ', ''),
          backgroundColor: Color(message.colour),
          duration: Duration(seconds: message.status != 200 ? 7 : 3),
        )..show(context)
      });
}

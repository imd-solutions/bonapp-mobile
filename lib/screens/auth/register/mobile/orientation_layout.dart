import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/includes/input/text.dart';
import 'package:flutter_bonapp/includes/select/dropdown.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/logo.dart';
import 'package:flutter_bonapp/partials/page_title.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/register/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';
import 'package:validators/validators.dart' as validator;

class RegisterMobilePortrait extends BaseModelWidget<RegisterViewModel> {
  final _formKey = GlobalKey<FormState>();
  final int titleID = 0;
  final User user = User();
  final Profile profile = Profile();

  @override
  Widget build(BuildContext context, RegisterViewModel data) {
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            child: Column(
              children: <Widget>[
                Logo(
                  height: 50.0,
                ),
                PageTitle(
                  title: 'Register',
                  height: 50.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      listWidget(context, _formKey, data, user, profile),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterMobileLandscape extends BaseModelWidget<RegisterViewModel> {
  final _formKey = GlobalKey<FormState>();
  final int titleID = 0;
  final User user = User();
  final Profile profile = Profile();
  @override
  Widget build(BuildContext context, RegisterViewModel data) {
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            child: Column(
              children: <Widget>[
                Logo(
                  height: 50.0,
                ),
                PageTitle(
                  title: 'Register',
                  height: 50.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      listWidget(context, _formKey, data, user, profile),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget listWidget(context, _formKey, data, user, profile) {
  var orientation = MediaQuery.of(context).orientation;
  String token = '1234567890abcdefg';

  void _snackBar(Message message) {
    Flushbar(
      title: message.title,
      message: message.message.replaceAll('[', '').replaceAll(']', ''),
      backgroundColor: Color(message.colour),
      duration: Duration(seconds: message.status != 200 ? 7 : 3),
    )..show(context).then(
        (_) {
          // Send the user to the Initial Application Screen on success.
          if (message.status == 200) {
            Navigator.of(context).pushNamedAndRemoveUntil(LoginScreenRoute, (Route<dynamic> route) => false);
          }
        },
      );
  }

  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 5.0),
              padding: EdgeInsets.only(left: 5.0),
              child: GestureDetector(
                onTap: () => data.initialVariables(),
                child: Dropdown(
                  selectedTitle: 'Title',
                  selected: data.titleDropdown,
                  data: data.titles,
                  updateSelected: (val) {
                    profile.title = val;
                    data.updateTitleNumber(val);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: InputText(
                initialValue: data.firstName,
                icon: Icons.person,
                hintText: 'First Name',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter firstname.';
                  }
                  return null;
                },
                onChanged: (String value) {
                  data.updateFirstName(value);
                },
                onSaved: (String value) {
                  profile.firstname = value;
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InputText(
              initialValue: data.lastName,
              icon: Icons.person,
              hintText: 'Surname',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter lastname.';
                }
                return null;
              },
              onChanged: (String value) {
                data.updateLastName(value);
              },
              onSaved: (String value) {
                profile.lastname = value;
              },
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: InputText(
              initialValue: data.email,
              icon: Icons.email,
              hintText: 'Email Address',
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  return 'Invalid email.';
                }
                return null;
              },
              onChanged: (String value) {
                data.updateEmail(value);
              },
              onSaved: (String value) {
                user.email = value;
              },
            ),
          ),
          Expanded(
            child: InputText(
              initialValue: data.mobile,
              icon: Icons.mobile_screen_share,
              hintText: 'Mobile',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter Mobile.';
                }
                return null;
              },
              onChanged: (String value) {
                data.updateMobile(value);
              },
              onSaved: (String value) {
                profile.mobileNumber = value;
              },
            ),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5.0, right: 10.0, bottom: 10.0, top: 10.0),
              padding: EdgeInsets.only(left: 5.0),
              child: GestureDetector(
                onTap: () => data.initialVariables(),
                child: Dropdown(
                  selectedTitle: 'Location',
                  selected: data.locationDropdown,
                  padding: true,
                  data: data.locations,
                  updateSelected: (val) {
                    data.updateLocation(val);
                    data.updateLocationNumber(val);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5.0, right: 10.0, bottom: 10.0, top: 10.0),
              padding: EdgeInsets.only(left: 5.0),
              child: GestureDetector(
                onTap: () => data.initialVariables(),
                child: Dropdown(
                  selectedTitle: 'Profession',
                  selected: data.professionDropdown,
                  padding: true,
                  data: data.professions,
                  updateSelected: (val) {
                    data.updateProfession(val);
                    data.updateProfessionNumber(val);
                  },
                ),
              ),
            ),
          )
        ],
      ),
      if (orientation == Orientation.portrait)
        Column(
          children: <Widget>[
            InputText(
              icon: Icons.lock,
              hintText: 'Password',
              isPassword: true,
              validator: (String value) {
                if (value.length < 6) {
                  return 'Minimum of 6 characters.';
                }
                _formKey.currentState.save();
                return null;
              },
              onSaved: (String value) {
                user.password = value;
              },
            ),
            InputText(
              icon: Icons.lock,
              hintText: 'Confirm Password',
              isPassword: true,
              validator: (String value) {
                if (value.length < 6) {
                  return 'Minimum of 6 characters.';
                } else if (user.password != null && value != user.password) {
                  return 'The passwords do not match.';
                }
                return null;
              },
            )
          ],
        ),
      if (orientation == Orientation.landscape)
        Row(
          children: <Widget>[
            Expanded(
              child: InputText(
                icon: Icons.lock,
                hintText: 'Password',
                isPassword: true,
                validator: (String value) {
                  if (value.length < 6) {
                    return 'Minimum of 6 characters.';
                  }
                  _formKey.currentState.save();
                  return null;
                },
                onSaved: (String value) {
                  user.password = value;
                },
              ),
            ),
            Expanded(
              child: InputText(
                icon: Icons.lock,
                hintText: 'Confirm Password',
                isPassword: true,
                validator: (String value) {
                  if (value.length < 6) {
                    return 'Minimum of 6 characters.';
                  } else if (user.password != null && value != user.password) {
                    return 'The passwords do not match.';
                  }
                  return null;
                },
              ),
            )
          ],
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              padding: EdgeInsets.all(10.0),
              child: data.state == ViewState.Processing
                  ? SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Color(whiteColour),
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      'Register',
                      style: TextStyle(
                        color: Color(whiteColour),
                        fontFamily: secondaryFont,
                      ),
                    ),
              color: Color(primaryColour),
              onPressed: () {
                // If missing location dropdown.
                if (data.locationDropdown == 0) {
                  Flushbar(
                    title: 'Warning',
                    message: 'You have not selected a location.',
                    backgroundColor: Color(warningColour),
                    duration: Duration(seconds: 5),
                  )..show(context);
                  return;
                }
                // If missing profession dropdwon.
                if (data.professionDropdown == 0) {
                  Flushbar(
                    title: 'Warning',
                    message: 'You have not selected a profession.',
                    backgroundColor: Color(warningColour),
                    duration: Duration(seconds: 5),
                  )..show(context);
                  return;
                }

                profile.location = data.location;
                profile.profession = data.profession;

                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  data.registerUser(user, profile, token).then(
                    (message) {
                      // Alert message to the user.
                      _snackBar(message);
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      SizedBox(height: 5.0),
      Container(
        alignment: Alignment(1.0, 0.0),
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            'Login',
            style: TextStyle(
              color: Color(accentSecondColour),
              fontWeight: FontWeight.bold,
              fontFamily: secondaryFont,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(LoginScreenRoute, (Route<dynamic> route) => false);
          },
        ),
      ),
    ],
  );
}

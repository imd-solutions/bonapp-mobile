import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/includes/input/text.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/partials/logo.dart';
import 'package:flutter_bonapp/partials/page_title.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/login/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:validators/validators.dart' as validator;
import 'package:flutter_bonapp/models/user.dart';

class LoginMobilePortrait extends BaseModelWidget<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();

  @override
  Widget build(BuildContext context, LoginViewModel data) {
    return Scaffold(
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Logo(
              height: 100.0,
            ),
            PageTitle(
              title: 'Login',
              height: 100.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  userEmailTextInput(user, _formKey),
                  userPasswordTextInput(user, _formKey),
                  loginBtn(context, user, _formKey, data),
                  SizedBox(height: 5.0),
                  registerForgottenPassword(context, data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginMobileLandscape extends BaseModelWidget<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();
  @override
  Widget build(BuildContext context, LoginViewModel data) {
    return Scaffold(
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        child: Column(
          children: <Widget>[
            Logo(
              height: 50.0,
            ),
            PageTitle(
              title: 'Login',
              height: 50.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: userEmailTextInput(user, _formKey),
                      ),
                      Expanded(
                        child: userPasswordTextInput(user, _formKey),
                      ),
                    ],
                  ),
                  loginBtn(context, user, _formKey, data),
                  SizedBox(height: 5.0),
                  registerForgottenPassword(context, data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// User login widget.
Widget userEmailTextInput(User user, _formKey) {
  return InputText(
    icon: Icons.email,
    hintText: 'Email Address',
    isEmail: true,
    validator: (String value) {
      if (!validator.isEmail(value)) {
        return 'Invalid email.';
      }
      _formKey.currentState.save();
      return null;
    },
    onSaved: (String value) {
      user.email = value;
    },
  );
}

// User password widget.
Widget userPasswordTextInput(User user, _formKey) {
  return InputText(
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
  );
}

// Login button.
Widget loginBtn(BuildContext context, User user, _formKey, LoginViewModel data) {
  // Alert the user of the progress..
  void _snackBar(Message message) {
    Flushbar(
      title: message.title,
      message: message.message.replaceAll('Exception: ', ''),
      backgroundColor: Color(message.colour),
      duration: Duration(seconds: message.status != 200 ? 7 : 3),
    )..show(context).then(
        (_) {
          // Send the user to the Initial Application Screen on success.
          if (message.status == 200) {
            Navigator.of(context).pushNamedAndRemoveUntil(InitialScreenRoute, (Route<dynamic> route) => false, arguments: message.data);
          }
        },
      );
  }

  return Column(
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
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(whiteColour),
                    ),
                  ),
                )
              : Text(
                  'Login',
                  style: TextStyle(
                    color: Color(whiteColour),
                    fontFamily: secondaryFont,
                  ),
                ),
          color: Color(primaryColour),
          onPressed: () {
            // Form validation is Successful.
            if (_formKey.currentState.validate()) {
              data.logUserIn(user).then(
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
  );
}

// Register/ Forgotten Password actions.
Widget registerForgottenPassword(BuildContext context, LoginViewModel data) {
  TextEditingController forgottenEmailTxt = TextEditingController();
  final _formAlertKey = GlobalKey<FormState>();

  var email = '';

  void _snackBar(Message message) {
    Flushbar(
      title: message.title,
      message: message.message,
      backgroundColor: Color(message.colour),
      duration: Duration(seconds: 7),
    )..show(context);
  }

  // Alert Dialog Popup.
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Forgotten Password',
            style: TextStyle(
              color: Color(primaryColour),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: primaryFont,
            ),
          ),
          content: Container(
            child: Form(
              key: _formAlertKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String value) {
                        if (!validator.isEmail(value)) {
                          return 'Invalid email.';
                        }
                        _formAlertKey.currentState.save();
                        return null;
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                      controller: forgottenEmailTxt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Request password via email',
                        labelText: 'Email Address',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Color(primaryColour),
              child: data.state == ViewState.Busy
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
                      'Submit',
                      style: TextStyle(
                        color: Color(whiteColour),
                        fontFamily: secondaryFont,
                      ),
                    ),
              onPressed: () {
                // Form validation is successfull.
                if (_formAlertKey.currentState.validate()) {
                  // Close the dialog.
                  Navigator.of(context).pop();
                  data.getForgottenPassword(email).then(
                    (message) {
                      _snackBar(message);
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: InkWell(
          child: Text(
            'Register',
            style: TextStyle(
              color: Color(accentSecondColour),
              fontWeight: FontWeight.bold,
              fontFamily: secondaryFont,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(RegisterScreenRoute, (Route<dynamic> route) => false);
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.only(right: 10.0),
        child: InkWell(
          child: Text(
            'Forgot Password',
            style: TextStyle(
              color: Color(accentSecondColour),
              fontWeight: FontWeight.bold,
              fontFamily: secondaryFont,
            ),
          ),
          onTap: () {
            _showDialog();
          },
        ),
      ),
    ],
  );
}

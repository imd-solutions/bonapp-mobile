import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/utils/constants.dart';

class InputText extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String label;
  final String hintText;
  final double hintTextSize;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  InputText({
    this.icon,
    this.iconSize = 15.0,
    this.label,
    this.hintText,
    this.hintTextSize = 12.0,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            this.icon,
            size: iconSize,
          ),
          labelText: this.label,
          hintText: this.hintText,
          hintStyle: TextStyle(
            fontSize: hintTextSize,
          ),
          contentPadding: EdgeInsets.only(
            top: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(greyColour),
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

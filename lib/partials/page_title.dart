import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class PageTitle extends StatelessWidget {
  final double height;
  final String title;
  PageTitle({this.height, this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: primaryFont,
            ),
          ),
          Text(
            '.',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: Color(primaryColour),
              fontFamily: primaryFont,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/models/sliders.dart';

class SlideItems extends StatelessWidget {
  final Sliders sliders;
  final double height;
  final double imageHeight;
  final double imageWidth;

  SlideItems({this.sliders, this.height, this.imageHeight, this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: height > 570.0 ? 200.0 : imageWidth,
          height: height > 570.0 ? 200.0 : imageHeight,
          decoration: BoxDecoration(
            color: Color(accentThirdColour),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(graphQLApi + sliders.imgUrl),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(
          height: height > 570.0 ? 20.0 : 10.00,
        ),
        Text(
          sliders.title,
          style: TextStyle(
            fontSize: 22.0,
            color: Color(accentSecondColour),
            fontFamily: primaryFont,
          ),
        ),
        SizedBox(
          height: height > 570.0 ? 20.0 : 10.0,
        ),
        Text(
          sliders.description,
          style: TextStyle(
            color: Color(accentSecondColour),
            fontSize: 15.0,
            fontFamily: secondaryFont,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height > 570.0 ? 20.0 : 10.00,
        ),
      ],
    );
  }
}

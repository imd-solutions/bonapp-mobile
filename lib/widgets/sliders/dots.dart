import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class SliderDots extends StatelessWidget {
  final bool isActive;

  SliderDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Color(secondaryColour) : Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }
}

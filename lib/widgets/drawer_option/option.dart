import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/drawer_items.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/widgets/drawer_option/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/widgets/drawer_option/tablet/orientation_layout.dart';
import 'package:provider/provider.dart';

class DrawerOption extends StatelessWidget {

  final String title;
  final IconData icon;

  DrawerOption({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
    value: DrawerItems(title: title, icon: icon),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => DrawerOptionMobilePortrait(),
          landscape: (context) => DrawerOptionMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => DrawerOptionTabletPortrait(),
          landscape: (context) => DrawerOptionTabletLandscape(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/widgets/app_drawer/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/widgets/app_drawer/tablet/orientation_layout.dart';
import 'package:flutter_bonapp/widgets/drawer_option/option.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        landscape: (context) => AppDrawerTabletLandscape(),
        portrait: (context) => AppDrawerTabletPortrait(),
      ),
    );
  }

  static List<Widget> getDrawerOptions() {
    return <Widget>[
      DrawerOption(
        title: 'Images',
        icon: Icons.image,
      ),
      DrawerOption(
        title: 'Reports',
        icon: Icons.photo_filter,
      ),
      DrawerOption(
        title: 'Incidents',
        icon: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        icon: Icons.settings,
      ),
    ];
  }
}

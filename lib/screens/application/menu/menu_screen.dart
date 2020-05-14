import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/menu/viewmodel.dart';

import '../../../responsive/orientation_layout.dart';
import '../../../responsive/screen_type_layout.dart';
import '../../../widgets/base_widget.dart';
import 'mobile/orientation_layout.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Screen'),
      ),
      body: Center(
        child: BaseWidget<MenuViewModel>(
            viewModel: MenuViewModel(),
            onModelReady: (model) => model.initialise(),
            builder: (context) => ScreenTypeLayout(
                  mobile: OrientationLayout(
                    portrait: (context) => MenuMobilePortrait(),
                    landscape: (context) => MenuMobileLandscape(),
                  ),
                  tablet: OrientationLayout(
                    portrait: (context) => MenuMobilePortrait(),
                    landscape: (context) => MenuMobileLandscape(),
                  ),
                )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/cart/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/cart/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<CartViewModel>(
        viewModel: CartViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => CartMobilePortrait(),
            landscape: (context) => CartMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => CartMobilePortrait(),
            landscape: (context) => CartMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

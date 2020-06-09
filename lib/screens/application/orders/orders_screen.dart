import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/orders/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/order/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class OrderScreen extends StatelessWidget {
  final User user;

  OrderScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<OrderViewModel>(
        viewModel: OrderViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => OrderMobilePortrait(),
            landscape: (context) => OrderMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => OrderMobilePortrait(),
            landscape: (context) => OrderMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

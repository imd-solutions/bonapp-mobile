import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/item/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/item/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class ItemScreen extends StatelessWidget {
  final Items item;

  ItemScreen({this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<ItemViewModel>(
        viewModel: ItemViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => ItemMobilePortrait(
                item: item
            ),
            landscape: (context) => ItemMobileLandscape(
                item: item
            ),
          ),
          tablet: OrientationLayout(
            portrait: (context) => ItemMobilePortrait(),
            landscape: (context) => ItemMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/category/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/category/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class CategoryScreen extends StatelessWidget {
  final Menu category;

  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<CategoryViewModel>(
        viewModel: CategoryViewModel(),
        onModelReady: (model) => model.initialise(category.id),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => CategoryMobilePortrait(
              category: category
            ),
            landscape: (context) => CategoryMobileLandscape(
              category: category
            ),
          ),
          tablet: OrientationLayout(
            portrait: (context) => CategoryMobilePortrait(),
            landscape: (context) => CategoryMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

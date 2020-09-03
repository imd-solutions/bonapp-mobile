import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/category/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class CategoryMobilePortrait extends BaseModelWidget<CategoryViewModel> {
  @override
  Widget build(BuildContext context, CategoryViewModel data) {
    return Container(
      child: const Text('Category Page.'),
    );
  }
}

class CategoryMobileLandscape extends BaseModelWidget<CategoryViewModel> {
  @override
  Widget build(BuildContext context, CategoryViewModel data) {
    return Container(
      child: const Text('Category Page.'),
    );
  }
}

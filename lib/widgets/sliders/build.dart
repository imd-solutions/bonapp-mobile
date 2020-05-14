import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/sliders/viewmodel.dart';
import 'package:flutter_bonapp/widgets/sliders/items.dart';

class BuildSliders extends StatelessWidget {
  final PageController pageController;
  final SlidersViewModel data;
  final double height, imageHeight, imageWidth;

  BuildSliders({this.pageController, this.data, this.height, this.imageHeight, this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      onPageChanged: data.setCur,
      itemCount: data.sliders.length,
      itemBuilder: (BuildContext context, int index) {
        return SlideItems(
          sliders: data.sliders[index].info,
          height: height,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
        );
      },
    );
  }
}

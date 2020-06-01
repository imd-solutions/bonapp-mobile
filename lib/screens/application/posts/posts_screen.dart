import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/posts/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/posts/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class PostsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<PostsViewModel>(
        viewModel: PostsViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => PostsMobilePortrait(),
            landscape: (context) => PostsMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => PostsMobilePortrait(),
            landscape: (context) => PostsMobileLandscape(),
          ),
        ),
      ),
    );
  }
}

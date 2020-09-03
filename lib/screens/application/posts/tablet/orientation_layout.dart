import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:flutter_bonapp/viewmodels/posts/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class PostsTabletPortrait extends BaseModelWidget<PostsViewModel> {
  final Post posts;
  PostsTabletPortrait({this.posts});

  @override
  Widget build(BuildContext context, PostsViewModel data) {
    return Container(
      child: const Text('Posts Page.'),
    );
  }
}

class PostsTabletLandscape extends BaseModelWidget<PostsViewModel> {
  final Post posts;
  PostsTabletLandscape({this.posts});

  @override
  Widget build(BuildContext context, PostsViewModel data) {
    return Container(
      child: const Text('Posts Page.'),
    );
  }
}

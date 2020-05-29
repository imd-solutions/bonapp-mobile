import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/post_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class PostsViewModel extends BaseModel {

  PostService postService = locator<PostService>();

  List<Post> allPosts;
  List<Post> latestPost;
  
  void initialise() {
    setState(ViewState.Busy);
    _updatePostInfo();
    notifyListeners();
  }

  Future<void> _updatePostInfo() async {

    allPosts = await postService.getPosts();
    latestPost = await postService.getLatestPosts(2);

    setState(ViewState.Completed);
    notifyListeners();
  }

}
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/post_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  PostService postService = locator<PostService>();

  User user;
  List<Post> allPosts;
  List<Post> latestPost;

  void initialise() {
    setState(ViewState.Busy);
    _updatePostInfo();
    notifyListeners();
  }

  Future<void> _updatePostInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    user = await userService.getUser(uid);

    allPosts = await postService.getPosts();
    latestPost = await postService.getLatestPosts(2);

    setState(ViewState.Completed);
    notifyListeners();
  }
}

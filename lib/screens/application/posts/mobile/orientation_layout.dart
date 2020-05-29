import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/posts/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PostsMobilePortrait extends BaseModelWidget<PostsViewModel> {
  final List<Post> posts;
  PostsMobilePortrait({this.posts});

  @override
  Widget build(BuildContext context, PostsViewModel data) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner_add.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 35.0,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.settings),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Find the latest news about Bon Appetit.",
                  style: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: primaryFont),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _navigateToUrl(posts[index]),
                    child: Card(
                      elevation: 1.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
//                      mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Image.network(graphQLApiImg + posts[index].image),
                              title: Text(posts[index].title),
                              subtitle: Text('View News...'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PostsMobileLandscape extends BaseModelWidget<PostsViewModel> {
  final List<Post> posts;
  PostsMobileLandscape({this.posts});

  @override
  Widget build(BuildContext context, PostsViewModel data) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 35.0,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.settings),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Find the latest news about Bon Appetit.",
                  style: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: primaryFont),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}

void _navigateToUrl(Post post) async {
  var url = post.siteLink;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

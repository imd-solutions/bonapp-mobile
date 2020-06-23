import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/posts/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

class PostsMobilePortrait extends BaseModelWidget<PostsViewModel> {
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
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                ApplicationHeader(route: 'goback'),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Find the latest news about Bon Appetit.",
                      style: TextStyle(fontSize: 15.0, color: Color(blackColour), fontFamily: primaryFont),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                if (data.state != ViewState.Busy)
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.allPosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => _navigateToUrl(data.allPosts[index]),
                          child: Card(
                            elevation: 1.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
//                      mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Image.network(graphQLApiImg + data.allPosts[index].image),
                                    title: Text(data.allPosts[index].title),
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
        ),
      ),
    );
  }
}

class PostsMobileLandscape extends BaseModelWidget<PostsViewModel> {
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
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                ApplicationHeader(route: 'goback'),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Find the latest news about Bon Appetit.",
                      style: TextStyle(fontSize: 15.0, color: Color(blackColour), fontFamily: primaryFont),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                if (data.state != ViewState.Busy)
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.allPosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => _navigateToUrl(data.allPosts[index]),
                          child: Card(
                            elevation: 1.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
//                      mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Image.network(graphQLApiImg + data.allPosts[index].image),
                                    title: Text(data.allPosts[index].title),
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

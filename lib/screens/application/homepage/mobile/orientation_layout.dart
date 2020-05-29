import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/home/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: _topHeaderInformation(data),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            _userInformation(
                              landscape: true,
                              icon: FontAwesomeIcons.trophy,
                              data: '20',
                              title: 'Points',
                              backgroundColour: 0xFFFD7384,
                            ),
                            SizedBox(
                              width: 2.5,
                            ),
                            Expanded(
                              child: Container(
                                height: 100.0,
                                child: Column(
                                  children: <Widget>[
                                    _userInformation(
                                      landscape: false,
                                      icon: FontAwesomeIcons.ticketAlt,
                                      data: '3',
                                      title: 'Vouchers',
                                      backgroundColour: 0XFF2BD093,
                                      rotate: true,
                                    ),
                                    SizedBox(
                                      height: 7.5,
                                    ),
                                    _userInformation(
                                      landscape: false,
                                      icon: FontAwesomeIcons.envelope,
                                      data: '4',
                                      title: 'Messages',
                                      backgroundColour: 0XFFFC7B4D,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  _rowHeader(
                    context: context,
                    title: 'Latest Offer',
                    view: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      _cardInformation(
                          context: context,
                          title: data.offer.name,
                          more: false,
                          data: data.offer),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  _rowHeader(
                    context: context,
                    title: 'Top Sellers',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      _cardInformation(
                          context: context,
                          title: data.featuredItems[0].name,
                          fontSize: 10.0,
                          height: 150.0,
                          data: data.featuredItems[0],
                          more: false),
                      SizedBox(
                        width: 5.0,
                      ),
                      _cardInformation(
                          context: context,
                          title: data.featuredItems[1].name,
                          fontSize: 10.0,
                          height: 150.0,
                          data: data.featuredItems[1],
                          more: false),
                      SizedBox(
                        width: 5.0,
                      ),
                      _cardInformation(
                          context: context,
                          title: data.featuredItems[2].name,
                          fontSize: 10.0,
                          height: 150.0,
                          data: data.featuredItems[2],
                          more: false),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
  }
}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: _topHeaderInformation(data),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        _userInformation(
                          landscape: true,
                          icon: FontAwesomeIcons.trophy,
                          data: '20',
                          title: 'Points',
                          backgroundColour: 0xFFFD7384,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _userInformation(
                          landscape: true,
                          icon: FontAwesomeIcons.ticketAlt,
                          data: '3',
                          title: 'Vouchers',
                          backgroundColour: 0XFF2BD093,
                          rotate: true,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _userInformation(
                          landscape: true,
                          icon: FontAwesomeIcons.envelope,
                          data: '4',
                          title: 'Messages',
                          backgroundColour: 0XFFFC7B4D,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _rowHeader(
                    context: context,
                    title: 'Latest Offer',
                    view: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      _cardInformation(
                          context: context,
                          title: data.offer.name,
                          more: false,
                          data: data.offer),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  _rowHeader(
                    context: context,
                    title: 'Top Sellers',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      _cardInformation(
                          context: context,
                          title: data.featuredItems[0].name,
                          data: data.featuredItems[0],
                          more: false),
                      SizedBox(
                        width: 5.0,
                      ),
                      _cardInformation(
                          context: context,
                          title: data.featuredItems[1].name,
                          data: data.featuredItems[1],
                          more: false),
                      SizedBox(
                        width: 5.0,
                      ),
                      _cardInformation(
                          context: context,
                          title: data.featuredItems[2].name,
                          data: data.featuredItems[2],
                          more: false),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

List<Widget> _topHeaderInformation(data) {
  return [
    SizedBox(
      height: 15.0,
    ),
    Row(
      children: <Widget>[
        Text(
          "Hello",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: primaryFont,
          ),
        ),
        data.user != null
            ? Text(
                data.user.profile.firstname,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: secondaryFont,
                ),
              )
            : Text(''),
      ],
    ),
    SizedBox(
      height: 5.0,
    ),
    Row(
      children: <Widget>[
        Text(
          "What would you like to do today?",
          style: TextStyle(
              fontSize: 15.0, color: Colors.black, fontFamily: primaryFont),
        ),
      ],
    ),
    SizedBox(
      height: 5.0,
    ),
  ];
}

Widget _rowHeader({context, title, data, view = true}) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      if (view)
        Expanded(
          child: GestureDetector(
            onTap: () => _navigateToPosts(context, data),
            child: Text(
              "View All",
              style: TextStyle(
                color: Color(primaryColour),
              ),
              textAlign: TextAlign.end,
            ),
          ),
        )
    ],
  );
}

Widget _userInformation(
    {landscape = false,
    height = 100.0,
    radius = 5.0,
    @required backgroundColour,
    @required icon,
    data = '10',
    iconColour = whiteColour,
    @required title,
    rotate = false}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Color(backgroundColour),
        ),
        child: landscape == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: FaIcon(
                        icon,
                        color: Color(iconColour),
                        size: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        data,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Color(iconColour),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Color(iconColour),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: FaIcon(
                      icon,
                      color: Color(iconColour),
                      size: 15.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      data,
                      style: TextStyle(
                        color: Color(iconColour),
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(iconColour),
                    ),
                  )
                ],
              ),
      ),
    ),
  );
}

Widget _cardInformation(
    {context,
    height = 150.0,
    containerHeight = 100.0,
    radius = 5.0,
    data,
    sizedBox = 5.0,
    fontSize = 15.0,
    @required title,
    more = true,
    item = true}) {
  return Expanded(
    child: GestureDetector(
      onTap: () =>
          item == true ? _navigateToItem(context, data) : _navigateToUrl(data),
      child: Container(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: containerHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  image: NetworkImage(graphQLApiImg + data.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: sizedBox,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: secondaryFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (more)
              Text(
                'Read more...',
                style: TextStyle(
                  fontSize: 10.0,
                  fontFamily: secondaryFont,
                ),
              )
          ],
        ),
      ),
    ),
  );
}

void _navigateToItem(BuildContext context, Items item) {
  Navigator.pushNamed(context, ItemScreenRoute, arguments: item);
}

void _navigateToPosts(BuildContext context, List<Post> posts) {
  Navigator.pushNamed(context, PostsScreenRoute, arguments: posts);
}

void _navigateToUrl(Post post) async {
  var url = post.siteLink;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

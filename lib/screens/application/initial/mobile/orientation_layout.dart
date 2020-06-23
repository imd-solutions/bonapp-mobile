import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/screens/application/homepage/home_screen.dart';
import 'package:flutter_bonapp/screens/application/loyalty/loyalty_screen.dart';
import 'package:flutter_bonapp/screens/application/menu/menu_screen.dart';
import 'package:flutter_bonapp/screens/application/reward/reward_screen.dart';
import 'package:flutter_bonapp/screens/application/scan/scan_screen.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/initial/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List _accountDrawerList = [
  {'icon': Icons.person, 'title': 'My Acount', 'page': AccountScreenRoute},
  {'icon': Icons.insert_comment, 'title': 'News', 'page': PostsScreenRoute},
  {'icon': Icons.mail_outline, 'title': 'My Messages', 'page': MessagesScreenRoute},
  {'icon': Icons.shopping_basket, 'title': 'My Orders', 'page': OrdersScreenRoute},
];

final List _informationDrawerList = [
  {'icon': Icons.subject, 'title': 'FAQ', 'page': FaqScreenRoute},
  {'icon': Icons.info, 'title': 'About', 'page': AboutScreenRoute},
];

final List _logoutDrawerList = [
  {'icon': FontAwesomeIcons.signOutAlt, 'title': 'Logout'},
];

List<BottomNavigationBarItem> _bottomNavBarList = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    title: Text('Home'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_overscan),
    title: Text('Scan'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_border),
    title: Text('Loyalty'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.local_cafe),
    title: Text('Rewards'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.local_dining),
    title: Text('Menu'),
  )
];

List<Widget> _drawerItems(User user, BuildContext context, InitialViewModel data) {
  return <Widget>[
    UserAccountsDrawerHeader(
      accountName: Text(user.name),
      accountEmail: Text(user.email),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(graphQLApiImg + user.avatar),
          backgroundColor: Colors.transparent,
        ),
      ),
    ),
    for (var index = 0; index < _accountDrawerList.length; index++)
      InkWell(
        onTap: () {
          _accountDrawerList[index]['page'] == MessagesScreenRoute
              ? Navigator.of(context).popAndPushNamed(_accountDrawerList[index]['page'])
              : Navigator.of(context).popAndPushNamed(_accountDrawerList[index]['page'], arguments: user);
        },
        child: ListTile(
          leading: Icon(
            _accountDrawerList[index]['icon'],
            color: Color(secondaryColour),
          ),
          title: Row(
            children: <Widget>[
              Text('${_accountDrawerList[index]['title']}'),
              Spacer(),
              _accountDrawerList[index]['page'] == OrdersScreenRoute && user.orders.length > 0
                  ? CircleNotification(
                      notification: user.orders.length,
                    )
                  : _accountDrawerList[index]['page'] == MessagesScreenRoute && data.userUnreadMessages.length > 0
                      ? CircleNotification(
                          notification: data.userUnreadMessages.length,
                        )
                      : Text(''),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    Divider(),
    for (var index = 0; index < _informationDrawerList.length; index++)
      InkWell(
        onTap: () => Navigator.of(context).pushNamed(_informationDrawerList[index]['page']),
        child: ListTile(
          leading: Icon(
            _informationDrawerList[index]['icon'],
          ),
          title: Text(_informationDrawerList[index]['title']),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    Divider(),
    for (var index = 0; index < _logoutDrawerList.length; index++)
      InkWell(
        onTap: () {
          data.logUserOut(context);
//          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (route) => false);
        },
        child: ListTile(
          leading: Icon(
            _logoutDrawerList[index]['icon'],
          ),
          title: Text(_logoutDrawerList[index]['title']),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    Divider(),
    ListTile(
      title: Row(
        children: <Widget>[
          Text(
            data.application.name,
            style: TextStyle(
              fontFamily: secondaryFont,
              fontSize: 12.0,
            ),
          ),
          Spacer(),
          Text(
            'Version: ${data.application.version}',
            style: TextStyle(
              fontFamily: secondaryFont,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    )
  ];
}

class InitialMobilePortrait extends BaseModelWidget<InitialViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final User user;

  InitialMobilePortrait({this.user});

  @override
  Widget build(BuildContext context, InitialViewModel data) {
    void bottomNavOnTap(int index) {
      data.updateBottomNavIndex(index);
    }

    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(bottomNavOnTap),
      ScanScreen(),
      LoyaltyScreen(),
      RewardScreen(),
      MenuScreen(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: data.state != ViewState.Busy
            ? ListView(
                padding: EdgeInsets.all(0.0),
                children: _drawerItems(user, context, data),
              )
            : null,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HomeApplicationHeader(scaffoldKey: _scaffoldKey),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _widgetOptions.elementAt(data.bottomNavIndex),
                ],
              ),
            ) //
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomNavOnTap,
        selectedItemColor: Color(primaryColour),
        unselectedItemColor: Color(accentThirdColour),
        currentIndex: data.bottomNavIndex, // this will be set when a new tab is tapped
        items: _bottomNavBarList,
      ),
    );
  }
}

class InitialMobileLandscape extends BaseModelWidget<InitialViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final User user;

  InitialMobileLandscape({this.user});

  @override
  Widget build(BuildContext context, InitialViewModel data) {
    void bottomNavOnTap(int index) {
      data.updateBottomNavIndex(index);
    }

    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(bottomNavOnTap),
      ScanScreen(),
      LoyaltyScreen(),
      RewardScreen(),
      MenuScreen(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: data.state != ViewState.Busy
            ? ListView(
                padding: EdgeInsets.all(0.0),
                children: _drawerItems(user, context, data),
              )
            : null,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HomeApplicationHeader(scaffoldKey: _scaffoldKey),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _widgetOptions.elementAt(data.bottomNavIndex),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomNavOnTap,
        selectedItemColor: Color(primaryColour),
        unselectedItemColor: Color(accentThirdColour),
        currentIndex: data.bottomNavIndex, // this will be set when a new tab is tapped
        items: _bottomNavBarList,
      ),
    );
  }
}

class CircleNotification extends StatelessWidget {
  final int notification;

  CircleNotification({this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 25.0,
      decoration: BoxDecoration(
        color: Color(secondaryColour),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$notification',
          style: TextStyle(
            color: Color(whiteColour),
          ),
        ),
      ),
    );
  }
}

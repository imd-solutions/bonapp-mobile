import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';

class InitialScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final User user;

  final List _accountDrawList = [
    {'icon': Icons.home, 'title': 'Home', 'page': InitialScreenRoute},
    {'icon': Icons.person, 'title': 'My Acount', 'page': AccountScreenRoute},
    {'icon': Icons.shopping_basket, 'title': 'My Orders', 'page': OrdersScreenRoute},
    {'icon': Icons.favorite, 'title': 'Favourites', 'page': FavouritesScreenRoute},
  ];

  final List _settingsDrawList = [
    {'icon': Icons.settings, 'title': 'Email', 'switch': 'email'},
    {'icon': Icons.volume_up, 'title': 'Notification', 'switch': 'notification'},
  ];

  final List _informationDrawList = [
    {'icon': Icons.subject, 'title': 'FAQ'},
    {'icon': Icons.info, 'title': 'About'},
  ];

  InitialScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: new EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Color(secondaryColour),
                  child: Icon(
                    Icons.person,
                    color: Color(thirdColour),
                  ),
                ),
              ),
            ),
            for (var index = 0; index < _accountDrawList.length; index++)
              InkWell(
                onTap: () {
                  Navigator.of(context).popAndPushNamed(_accountDrawList[index]['page']);
                },
                child: ListTile(
                  leading: Icon(
                    _accountDrawList[index]['icon'],
                    color: Color(secondaryColour),
                  ),
                  title: Text(_accountDrawList[index]['title']),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            Divider(),
            for (var index = 0; index < _settingsDrawList.length; index++)
              InkWell(
                onTap: () => print('Tapped'),
                child: ListTile(
                  leading: Icon(
                    _settingsDrawList[index]['icon'],
                    color: Color(blueColour),
                  ),
                  title: Text(_settingsDrawList[index]['title']),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
              ),
            Divider(),
            for (var index = 0; index < _informationDrawList.length; index++)
              InkWell(
                onTap: () => print('Tapped'),
                child: ListTile(
                  leading: Icon(
                    _informationDrawList[index]['icon'],
                  ),
                  title: Text(_informationDrawList[index]['title']),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  icon: Icon(Icons.menu),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 50.0,
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.shopping_cart),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

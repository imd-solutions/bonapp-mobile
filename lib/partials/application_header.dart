import 'package:flutter/material.dart';

class HomeApplicationHeader extends StatelessWidget {
  const HomeApplicationHeader({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey, super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}

class ApplicationHeader extends StatelessWidget {
  const ApplicationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
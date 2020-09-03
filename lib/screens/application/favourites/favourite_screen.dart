import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    const Text('Favourites Page',
                      style: TextStyle(fontFamily: primaryFont),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.settings),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

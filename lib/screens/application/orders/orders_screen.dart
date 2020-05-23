import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
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
                    Text(
                      'My Orders',
                      style: TextStyle(fontFamily: 'Poppins'),
                    )
                  ],
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

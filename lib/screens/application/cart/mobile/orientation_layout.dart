import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/cart/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/cart/items.dart';

class CartMobilePortrait extends BaseModelWidget<CartViewModel> {
  @override
  Widget build(BuildContext context, CartViewModel data) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: data.itemCount > 0
              ? Column(
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
                    Text(
                      'Cart Items.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      height: height * 0.81,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: data.items.length,
                              itemBuilder: (ctx, i) => CartItems(
                                data.items.values.toList()[i].id.toString(),
                                data.items.keys.toList()[i],
                                data.items.values.toList()[i].price,
                                data.items.values.toList()[i].quantity,
                                data.items.values.toList()[i].name,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Total:',
                                    style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                                  ),
                                  Text(
                                    '£20.00',
                                    style: TextStyle(fontSize: 25.0, fontFamily: 'Raleway'),
                                  ),
                                ],
                              ),
                              Spacer(),
                              RaisedButton(
                                color: Color(primaryColour),
                                onPressed: () => print('CHECKOUT'),
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(color: Color(whiteColour), fontSize: 20.0, fontFamily: 'Raleway'),
                                ),
                              ),
                              FlatButton(
                                onPressed: () => data.clearCartItems(),
                                child: Text(
                                  'Clear',
                                  style: TextStyle(color: Color(secondaryColour), fontSize: 20.0, fontFamily: 'Raleway'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(InitialScreenRoute, (Route<dynamic> route) => false, arguments: data.user),
                          icon: Icon(Icons.home),
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
                    Center(
                      child: Text(
                        'There are no items in your cart.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                          color: Color(accentSecondColour),
                        ),
                      ),
                    ),
                    Text('')
                  ],
                ),
        ),
      ),
    );
  }
}

class CartMobileLandscape extends BaseModelWidget<CartViewModel> {
  @override
  Widget build(BuildContext context, CartViewModel data) {
    return Container(
      child: Text('Cart Page.'),
    );
  }
}

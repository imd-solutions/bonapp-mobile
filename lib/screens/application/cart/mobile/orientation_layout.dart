import 'package:flutter/material.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
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
                    CartApplicationHeader(),
                    Text(
                      'Cart Items.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: primaryFont,
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
                              itemBuilder: (ctx, i) => Dismissible(
                                key: ValueKey(data.items.values.toList()[i].id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                ),
                                onDismissed: (direction) {
//        print("WTF!!!");
                                  data.removeItem(data.items.values.toList()[i].id);
                                },
                                child: CartItems(
                                  data.items.values.toList()[i].id.toString(),
                                  data.items.keys.toList()[i],
                                  data.items.values.toList()[i].price,
                                  data.items.values.toList()[i].quantity,
                                  data.items.values.toList()[i].name,
                                ),
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
                                    style: TextStyle(fontSize: 15.0, fontFamily: primaryFont),
                                  ),
                                  Text(
                                    '£${data.cartSubTotal.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 25.0, fontFamily: secondaryFont),
                                  ),
                                ],
                              ),
                              Spacer(),
                              RaisedButton(
                                color: Color(primaryColour),
                                onPressed: () => Navigator.pushNamed(context, CheckoutScreenRoute),
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(color: Color(whiteColour), fontSize: 20.0, fontFamily: secondaryFont),
                                ),
                              ),
                              FlatButton(
                                onPressed: () => data.clearCartItems(),
                                child: Text(
                                  'Clear',
                                  style: TextStyle(color: Color(secondaryColour), fontSize: 20.0, fontFamily: secondaryFont),
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
                    CartApplicationHeader(user: data.user),
                    Center(
                      child: Text(
                        'There are no items in your cart.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: primaryFont,
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
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: data.itemCount > 0
              ? Column(
                  children: <Widget>[
                    // TEST!
                    CartApplicationHeader(user: data.user),
                    Text(
                      'Cart Items.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: primaryFont,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      height: height * 0.7,
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
                                    style: TextStyle(fontSize: 15.0, fontFamily: primaryFont),
                                  ),
                                  Text(
                                    '£${data.cartSubTotal.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 25.0, fontFamily: secondaryFont),
                                  ),
                                ],
                              ),
                              Spacer(),
                              RaisedButton(
                                color: Color(primaryColour),
                                onPressed: () => Navigator.pushNamed(context, CheckoutScreenRoute),
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(color: Color(whiteColour), fontSize: 20.0, fontFamily: secondaryFont),
                                ),
                              ),
                              FlatButton(
                                onPressed: () => data.clearCartItems(),
                                child: Text(
                                  'Clear',
                                  style: TextStyle(color: Color(secondaryColour), fontSize: 20.0, fontFamily: secondaryFont),
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
                    CartApplicationHeader(),
                    Center(
                      child: Text(
                        'There are no items in your cart.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: primaryFont,
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

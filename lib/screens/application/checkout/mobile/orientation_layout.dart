import 'package:flutter/material.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/checkout/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class CartItems {
  String number;
  String text;
  String secondaryText;
  String amount;
  CartItems({@required this.number, @required this.text, @required this.secondaryText, @required this.amount});
}

class CheckoutMobilePortrait extends BaseModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    return Scaffold(
      backgroundColor: Color(whiteColour),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CheckoutApplicationHeader(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Order Summary',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: primaryFont,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ListView.builder(
                    itemCount: data.items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var name = data.items.values.toList()[index].name;
                      var subtitle = data.items.values.toList()[index].subtitle;
                      var price = data.items.values.toList()[index].price;
                      var qty = data.items.values.toList()[index].quantity;
                      var total = price * qty;

                      return Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 24.0,
                                width: 24.0,
                                child: Center(
                                  child: Text(
                                    qty.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      fontFamily: secondaryFont,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text('x'),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '$name (£${price.toStringAsFixed(2)})',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: secondaryFont,
                                      ),
                                    ),
                                    if (subtitle != null)
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            subtitle,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(accentThirdColour),
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                              Text(
                                '£${total.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Color(secondaryColour),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(accentThirdColour),
                            height: 1.0,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal:',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentColour),
                        ),
                      ),
                      Text(
                        '£${data.cartSubTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentThirdColour),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tax (20%):',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentColour),
                        ),
                      ),
                      Text(
                        '${data.cartTax.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentThirdColour),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${data.cartTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Pickup',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Maple Cross HS2',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentThirdColour),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.0,
                  ), //
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 80.0,
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SUBMIT ORDER',
                    style: TextStyle(color: Color(whiteColour), fontWeight: FontWeight.bold),
                  ),
                  color: Color(primaryColour),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CheckoutMobileLandscape extends BaseModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    return Scaffold(
      backgroundColor: Color(whiteColour),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CheckoutApplicationHeader(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Order Summary',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: primaryFont,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ListView.builder(
                    itemCount: data.items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var name = data.items.values.toList()[index].name;
                      var subtitle = data.items.values.toList()[index].subtitle;
                      var price = data.items.values.toList()[index].price;
                      var qty = data.items.values.toList()[index].quantity;
                      var total = price * qty;

                      return Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 24.0,
                                width: 24.0,
                                child: Center(
                                  child: Text(
                                    qty.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      fontFamily: secondaryFont,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text('x'),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '$name (£${price.toStringAsFixed(2)})',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: secondaryFont,
                                      ),
                                    ),
                                    if (subtitle != null)
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            subtitle,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(accentThirdColour),
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                              Text(
                                '£${total.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Color(secondaryColour),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: secondaryFont,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(accentThirdColour),
                            height: 1.0,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal:',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentColour),
                        ),
                      ),
                      Text(
                        '£${data.cartSubTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentThirdColour),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tax (20%):',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentColour),
                        ),
                      ),
                      Text(
                        '${data.cartTax.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentThirdColour),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${data.cartTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Pickup',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Maple Cross HS2',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(accentThirdColour),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.0,
                  ), //
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 80.0,
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SUBMIT ORDER',
                    style: TextStyle(color: Color(whiteColour), fontWeight: FontWeight.bold),
                  ),
                  color: Color(primaryColour),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

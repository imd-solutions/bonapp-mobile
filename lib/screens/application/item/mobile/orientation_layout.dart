import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/item/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class ItemMobilePortrait extends BaseModelWidget<ItemViewModel> {
  final Items item;

  ItemMobilePortrait({this.item});

  @override
  Widget build(BuildContext context, ItemViewModel data) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner_add_2.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[
              ApplicationHeader(
                route: 'goback',
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.all(6),
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(secondaryColour),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(graphQLApiImg + item.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: item.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(primaryColour),
                          ),
                        ),
                        if (item.subtitle != null)
                          TextSpan(
                            text: "\n${item.subtitle}",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(blackColour).withOpacity(.5),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    "£${item.price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: secondaryFont,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    data.itemAmount(item.id) > 0
                        ? Container(
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                            decoration: BoxDecoration(
                              color: Color(primaryColour).withOpacity(.19),
                              borderRadius: BorderRadius.circular(27),
                            ),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    data.removeSingleItemFromCart(item.id);
                                    Flushbar(
                                      title: 'Success',
                                      message: 'That item has been removed.',
                                      backgroundColor: Color(successColour),
                                      duration: Duration(seconds: 5),
                                    )..show(context);
                                  }, //removeItemFromCart
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 30),
                                Text(
                                  data.itemAmount(item.id).toString(),
                                  style: Theme.of(context).textTheme.button,
                                ),
                                SizedBox(width: 30),
                                GestureDetector(
                                  onTap: () {
                                    data.addItemToCart(item.id, item.name, item.subtitle, item.price);
                                    Flushbar(
                                      title: 'Success',
                                      message: 'That item has been added.',
                                      backgroundColor: Color(successColour),
                                      duration: Duration(seconds: 5),
                                    )..show(context);
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              data.addItemToCart(item.id, item.name, item.subtitle, item.price);
                              Flushbar(
                                title: 'Success',
                                message: 'That item has been added.',
                                backgroundColor: Color(successColour),
                                duration: Duration(seconds: 5),
                              )..show(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                              decoration: BoxDecoration(
                                color: Color(primaryColour).withOpacity(.19),
                                borderRadius: BorderRadius.circular(27),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Add to Cart",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  SizedBox(width: 30),
                                  Icon(Icons.add),
                                ],
                              ),
                            ),
                          ),
                    GestureDetector(
                      onTap: () => _navigateToCart(context),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(primaryColour).withOpacity(.26),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(15),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(primaryColour),
                              ),
                              child: Icon(Icons.shopping_basket),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 5,
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(whiteColour),
                                ),
                                child: Text(
                                  data.cartItemCount.toString(),
                                  style: Theme.of(context).textTheme.button.copyWith(color: Color(primaryColour), fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemMobileLandscape extends BaseModelWidget<ItemViewModel> {
  final Items item;

  ItemMobileLandscape({this.item});

  @override
  Widget build(BuildContext context, ItemViewModel data) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner_add_2.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              ApplicationHeader(
                route: 'goback',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 30.0),
                                padding: EdgeInsets.all(6),
                                height: 210.0,
                                width: 210.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(secondaryColour),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(graphQLApiImg + item.image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: item.name,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(primaryColour),
                                              ),
                                            ),
                                            if (item.subtitle != null)
                                              TextSpan(
                                                text: "\n${item.subtitle}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Color(blackColour).withOpacity(.5),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "£${item.price.toStringAsFixed(2)}",
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        data.itemAmount(item.id) > 0
                                            ? Container(
                                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                                                decoration: BoxDecoration(
                                                  color: Color(primaryColour).withOpacity(.19),
                                                  borderRadius: BorderRadius.circular(27),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        data.removeSingleItemFromCart(item.id);
                                                        Flushbar(
                                                          title: 'Success',
                                                          message: 'That item has been removed.',
                                                          backgroundColor: Color(successColour),
                                                          duration: Duration(seconds: 5),
                                                        )..show(context);
                                                      }, //removeItemFromCart
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    SizedBox(width: 30),
                                                    Text(
                                                      data.itemAmount(item.id).toString(),
                                                      style: Theme.of(context).textTheme.button,
                                                    ),
                                                    SizedBox(width: 30),
                                                    GestureDetector(
                                                      onTap: () {
                                                        data.addItemToCart(item.id, item.name, item.subtitle, item.price);
                                                        Flushbar(
                                                          title: 'Success',
                                                          message: 'That item has been added.',
                                                          backgroundColor: Color(successColour),
                                                          duration: Duration(seconds: 5),
                                                        )..show(context);
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  data.addItemToCart(item.id, item.name, item.subtitle, item.price);
                                                  Flushbar(
                                                    title: 'Success',
                                                    message: 'That item has been added.',
                                                    backgroundColor: Color(successColour),
                                                    duration: Duration(seconds: 5),
                                                  )..show(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                                                  decoration: BoxDecoration(
                                                    color: Color(primaryColour).withOpacity(.19),
                                                    borderRadius: BorderRadius.circular(27),
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Add to Cart",
                                                        style: Theme.of(context).textTheme.button,
                                                      ),
                                                      SizedBox(width: 30),
                                                      Icon(Icons.add),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                        GestureDetector(
                                          onTap: () => _navigateToCart(context),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(primaryColour).withOpacity(.26),
                                            ),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(primaryColour),
                                                  ),
                                                  child: Icon(Icons.shopping_basket),
                                                ),
                                                Positioned(
                                                  right: 5,
                                                  bottom: 5,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 28,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(whiteColour),
                                                    ),
                                                    child: Text(
                                                      data.cartItemCount.toString(),
                                                      style: Theme.of(context).textTheme.button.copyWith(color: Color(primaryColour), fontSize: 16),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToCart(BuildContext context) {
  Navigator.pushNamed(context, CartScreenRoute);
}

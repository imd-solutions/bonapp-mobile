import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
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
//        child: Container(
//          decoration: BoxDecoration(),
//            child: Image.asset('assets/images/banner_add.jpg')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                    ],
                  ),
                  IconButton(
                    onPressed: () => print('Alert Bar'),
                    icon: Icon(Icons.settings),
                  )
                ],
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
                    Container(
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
                    Container(
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
                                "0",
                                style: Theme.of(context).textTheme.button.copyWith(color: Color(primaryColour), fontSize: 16),
                              ),
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
      ),
    );
  }
}

class ItemMobileLandscape extends BaseModelWidget<ItemViewModel> {
  final Items item;

  ItemMobileLandscape({this.item});

  @override
  Widget build(BuildContext context, ItemViewModel data) {
    return Scaffold();
  }
}

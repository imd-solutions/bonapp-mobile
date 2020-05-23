import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/hero_type.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/screens/application/menuitems/menuitem_screen.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/menu/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';

class MenuMobilePortrait extends BaseModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel data) {
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "What would you like to have today?",
                        style: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: primaryFont),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Featured',
                        style: TextStyle(fontFamily: primaryFont, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'See more',
                              style: TextStyle(
                                fontFamily: secondaryFont,
                                fontSize: 10.0,
                                color: Color(primaryColour),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10.0,
                              color: Color(primaryColour),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 120.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.menus.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  height: 85.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xff7c94b6),
                                    image: DecorationImage(
                                      image: NetworkImage(graphQLApiImg + data.featuredItems[index].itemInfo.image),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: Color(secondaryColour),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 90.0,
                                left: 5.0,
                                child: Text(
                                  data.featuredItems[index].itemInfo.name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (data.featuredItems[index].itemInfo.subtitle != null)
                                Positioned(
                                  top: 105.0,
                                  left: 5.0,
                                  child: Text(
                                    data.featuredItems[index].itemInfo.subtitle,
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 8.0,
                                    ),
                                  ),
                                )
                            ],
                          );
                        }),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Categories',
                        style: TextStyle(fontFamily: primaryFont, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'See more',
                              style: TextStyle(
                                fontFamily: secondaryFont,
                                fontSize: 10.0,
                                color: Color(primaryColour),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10.0,
                              color: Color(primaryColour),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 110.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.menus.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  height: 85.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xff7c94b6),
                                    image: DecorationImage(
                                      image: NetworkImage(graphQLApiImg + data.menus[index].info.imgIcon),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 90.0,
                                left: 5.0,
                                child: Text(
                                  data.menus[index].info.name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      Text(
                        'Pick of the day',
                        style: TextStyle(fontFamily: primaryFont, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'See more',
                              style: TextStyle(
                                fontFamily: secondaryFont,
                                fontSize: 10.0,
                                color: Color(primaryColour),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10.0,
                              color: Color(primaryColour),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - _pickDaySize(MediaQuery.of(context).size.height.toInt()),
                    child: GridView.count(crossAxisCount: 2, primary: false, crossAxisSpacing: 10.0, mainAxisSpacing: 15.0, childAspectRatio: 0.8, children: <Widget>[
                      for (var i = 0; i < data.pickOfDayItems.length; i++)
                        _buildCard(
                          data.pickOfDayItems[i].pickInfo.name,
                          '£${data.pickOfDayItems[i].pickInfo.price.toStringAsFixed(2)}',
                          graphQLApiImg + data.pickOfDayItems[i].pickInfo.image,
                          false,
                          false,
                          context,
                        ),
                    ]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Bon Appetit!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', fontSize: 15.0),
                  )
                ],
              ),
            ),
          );
  }
}

class MenuMobileLandscape extends BaseModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel data) {
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Categories',
                        style: TextStyle(fontFamily: primaryFont, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'See more',
                              style: TextStyle(
                                fontFamily: secondaryFont,
                                fontSize: 10.0,
                                color: Color(primaryColour),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10.0,
                              color: Color(primaryColour),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: 200.0,
                      child: ListView.builder(
                          itemCount: data.menus.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text('TEST');
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

Widget _buildCard(String name, String price, String imgPath, bool added, bool isFavorite, context) {
  var screenHeight = MediaQuery.of(context).size.height;

  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Color(0xFFEF7532),
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Color(0xFFEF7532),
                        ),
                ],
              ),
            ),
            Hero(
              tag: imgPath,
              child: Container(
                height: _imageSize(screenHeight.toInt()),
                width: _imageSize(screenHeight.toInt()),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              price,
              style: TextStyle(
                color: Color(primaryColour),
                fontFamily: 'Poppins',
                fontSize: _priceNameSize(screenHeight.toInt()),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Color(accentColour),
                fontFamily: 'Raleway',
                fontSize: _priceNameSize(screenHeight.toInt()),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!added) ...[
                    Icon(
                      Icons.shopping_basket,
                      color: Color(0xFFD17E50),
                      size: _cartSize(screenHeight.toInt()),
                    ),
                    Text(
                      'Add to cart',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        color: Color(0xFFD17E50),
                        fontSize: _cartSize(screenHeight.toInt()),
                      ),
                    )
                  ],
                  if (added) ...[
                    Icon(Icons.remove_circle_outline, color: Color(0xFFD17E50), size: 12.0),
                    Text(
                      '3',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        color: Color(0xFFD17E50),
                        fontWeight: FontWeight.bold,
                        fontSize: _cartSize(screenHeight.toInt()),
                      ),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xFFD17E50),
                      size: _cartSize(screenHeight.toInt()),
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class ItemCard extends StatelessWidget {
  final Items items;

  ItemCard(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: NetworkImage(graphQLApiImg + items.image),
                height: 65.0,
                width: 65.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    items.name,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '£${items.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  final dynamic categories;

  BannerWidgetArea({this.categories});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(viewportFraction: 1.0, initialPage: 0);

    List<Widget> banners = new List<Widget>();

    void goToNewPage(data) {
      // PageRouteBuilder
      Navigator.of(context).push(
        PageRouteBuilder(
          fullscreenDialog: true,
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return MenuItemScreen(
              heroType: HeroType(
                title: data.name,
                description: data.description,
                image: data.imgUrl,
                colour: secondaryColour,
              ),
            );
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
              child: child,
            );
          },
        ),
      );
    }

    for (int x = 0; x < categories.length; x++) {
      var bannerView = Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: GestureDetector(
          onTap: () => goToNewPage(categories[x].info),
          child: Stack(
            overflow: Overflow.visible,
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.5,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Image.network(
                  graphQLApiImg + categories[x].info.imgIcon,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      categories[x].info.name,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Poppins',
                        color: Color(whiteColour),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      categories[x].info.description,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Raleway',
                        color: Color(whiteColour),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Expanded(
      child: Container(
        width: screenWidth,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: banners,
        ),
      ),
    );
  }
}

double _pickDaySize(int height) {
  if (height < 570) {
    return 200.0;
  } else if (height < 745) {
    return 200.0;
  } else if (height < 815) {
    return 350.0;
  } else if (height < 879) {
    return 400.0;
  } else if (height < 900) {
    return 380.0;
  } else if (height < 970) {
    return 400.0;
  }
}

double _imageSize(int height) {
  if (height < 570) {
    return 60.0;
  } else if (height < 745) {
    return 75.0;
  } else if (height < 879) {
    return 90.0;
  } else if (height < 900) {
    return 104.5;
  } else if (height < 970) {
    return 110.0;
  }
}

double _priceNameSize(int height) {
  if (height < 570) {
    return 12.0;
  } else if (height < 745) {
    return 13.0;
  } else if (height < 879) {
    return 14.5;
  } else if (height < 900) {
    return 18.0;
  } else if (height < 970) {
    return 20.0;
  }
}

double _cartSize(int height) {
  if (height < 570) {
    return 10.0;
  } else if (height < 745) {
    return 12.0;
  } else if (height < 879) {
    return 12.5;
  } else if (height < 900) {
    return 15.0;
  } else if (height < 970) {
    return 18.0;
  }
}

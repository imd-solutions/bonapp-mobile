import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
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
                  Column(
                    children: _topHalfScreen(data),
                  ),
                  ColumnHeader(
                    title: 'Pick of the Day',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - _pickDaySize(MediaQuery.of(context).size.height.toInt()),
                    child: GridView.count(
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        for (var i = 0; i < data.pickOfDayItems.length; i++)
                          _buildCard(
                            data.pickOfDayItems[i].pickInfo.name,
                            '£${data.pickOfDayItems[i].pickInfo.pivot.mainPrice.toStringAsFixed(2)}',
                            graphQLApiImg + data.pickOfDayItems[i].pickInfo.image,
                            false,
                            false,
                            context,
                            data.pickOfDayItems[i].pickInfo,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ColumnFooter(
                    title: 'Bon Appetit!',
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
                  Column(
                    children: _topHalfScreen(data),
                  ),
                  ColumnHeader(
                    title: 'Pick of the Day',
                    more: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 200.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (var i = 0; i < data.pickOfDayItems.length; i++)
                          _buildCard(
                            data.pickOfDayItems[i].pickInfo.name,
                            '£${data.pickOfDayItems[i].pickInfo.pivot.mainPrice.toStringAsFixed(2)}',
                            graphQLApiImg + data.pickOfDayItems[i].pickInfo.image,
                            false,
                            false,
                            context,
                            data.pickOfDayItems[i].pickInfo,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ColumnFooter(
                    title: 'Bon Appetit!',
                  )
                ],
              ),
            ),
          );
  }
}

class ColumnHeader extends StatelessWidget {
  final String title;
  final bool more;

  ColumnHeader({
    Key key,
    this.title,
    this.more = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: primaryFont,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        if (more)
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
    );
  }
}

class ColumnFooter extends StatelessWidget {
  final String title;
  final double fontSize;

  const ColumnFooter({
    Key key,
    this.title,
    this.fontSize = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
        fontSize: fontSize,
      ),
    );
  }
}

Widget _buildCard(String name, String price, String imgPath, bool added, bool isFavorite, context, Items item) {
  var screenHeight = MediaQuery.of(context).size.height;
  var orientation = MediaQuery.of(context).orientation;

  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () => _navigateToItem(context, item),
      child: Container(
        margin: orientation == Orientation.landscape ? EdgeInsets.only(right: 20.0) : null,
        width: orientation == Orientation.landscape ? 150.0 : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Color(greyColour).withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Color(whiteColour),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFFEF7532),
                  ),
                  Spacer(),
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
              tag: name + imgPath,
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
                fontFamily: primaryFont,
                fontSize: _priceNameSize(screenHeight.toInt()),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Color(accentColour),
                fontFamily: secondaryFont,
                fontSize: _priceNameSize(screenHeight.toInt()),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          ],
        ),
      ),
    ),
  );
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
  } else {
    return 450.0;
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
  } else {
    return 120.0;
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
  } else {
    return 25.0;
  }
}

List<Widget> _topHalfScreen(MenuViewModel data) {
  return [
    SizedBox(
      height: 15.0,
    ),
    Row(
      children: <Widget>[
        Text(
          "What would you like to have today?",
          style: TextStyle(fontSize: 15.0, color: Color(blackColour), fontFamily: primaryFont),
        ),
      ],
    ),
    SizedBox(
      height: 5.0,
    ),
    ColumnHeader(
      title: 'Featured',
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
            return GestureDetector(
              onTap: () => _navigateToItem(context, data.featuredItems[index].itemInfo),
              child: Stack(
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
                        fontFamily: primaryFont,
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
                          fontFamily: secondaryFont,
                          fontSize: 8.0,
                        ),
                      ),
                    )
                ],
              ),
            );
          }),
    ),
    ColumnHeader(
      title: 'Categories',
    ),
    SizedBox(
      height: 5.0,
    ),
    Container(
      height: 110.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.menus.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => _navigateToCategory(context, data.menus[index].info),
              child: Stack(
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
                        fontFamily: primaryFont,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
    SizedBox(height: 15.0),
  ];
}

void _navigateToCategory(BuildContext context, Menu menu) {
  Navigator.pushNamed(context, CategoryScreenRoute, arguments: menu);
}

void _navigateToItem(BuildContext context, Items item) {
  Navigator.pushNamed(context, ItemScreenRoute, arguments: item);
}

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/category/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CategoryMobilePortrait extends BaseModelWidget<CategoryViewModel> {
  final Menu category;

  CategoryMobilePortrait({this.category});
  @override
  Widget build(BuildContext context, CategoryViewModel data) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/banner_add.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ApplicationHeader(route: 'goback'),
              Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(
                      height: 200.0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Color(blackColour).withOpacity(0.2),
                          BlendMode.dstATop,
                        ),
                        image: NetworkImage(graphQLApiImg + category.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120.0,
                    left: 10.0,
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 155.0,
                    left: 10.0,
                    child: Container(
                      width: width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            category.description,
                            style: TextStyle(fontFamily: secondaryFont, fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ColumnHeader(
                title: 'Scroll down for more.',
                more: false,
              ),
              SizedBox(
                height: 10.0,
              ),
              if (data.state != ViewState.Busy)
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      for (var i = 0; i < data.categoryItems.length; i++)
                        _buildListItem(
                          data.categoryItems[i],
                          4.0,
                          width,
                          orientation,
                          context,
                          data,
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryMobileLandscape extends BaseModelWidget<CategoryViewModel> {
  final Menu category;

  CategoryMobileLandscape({this.category});
  @override
  Widget build(BuildContext context, CategoryViewModel data) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                ApplicationHeader(route: 'goback'),
                Stack(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints.expand(
                        height: 200.0,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Color(blackColour).withOpacity(0.2),
                            BlendMode.dstATop,
                          ),
                          image: NetworkImage(graphQLApiImg + category.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 125.0,
                      left: 10.0,
                      child: Text(
                        category.name,
                        style: TextStyle(fontSize: 25.0, fontFamily: primaryFont, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 165.0,
                      left: 10.0,
                      child: Text(
                        category.description,
                        style: TextStyle(fontFamily: secondaryFont, fontSize: 15.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ColumnHeader(
                  title: 'Scroll left/right more.',
                  more: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                if (data.state != ViewState.Busy)
                  Container(
                    height: 120.0,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (var i = 0; i < data.categoryItems.length; i++)
                          _buildListItem(
                            data.categoryItems[i],
                            4.0,
                            width,
                            orientation,
                            context,
                            data,
                          ),
                      ],
                    ),
                  )
              ],
            ),
          ),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
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
      ),
    );
  }
}

_buildListItem(Items item, double rating, double width, Orientation orientation, BuildContext context, CategoryViewModel data) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: orientation == Orientation.portrait
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    width: width,
                    child: Row(
                      children: [
                        Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(secondaryColour),
                          ),
                          child: Center(
                            child: Image.network(graphQLApiImg + item.image, height: 70.0, width: 70.0),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.name,
                              style: TextStyle(
                                fontFamily: primaryFont,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 2.5,
                            ),
                            item.subtitle != null ? Text(item.subtitle) : Text(''),
                            SizedBox(
                              height: 2.5,
                            ),
                            SmoothStarRating(
                              allowHalfRating: false,
                              starCount: rating.toInt(),
                              rating: rating,
                              color: Color(0xFFFFD143),
                              borderColor: Color(0xFFFFD143),
                              size: 15.0,
                              spacing: 0.0,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '£${item.pivot.mainPrice.toStringAsFixed(2)}',
                                  style: TextStyle(fontFamily: secondaryFont),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _navigateToItem(context, item);
                                  },
                                  child: Icon(
                                    Icons.info,
                                    size: 18.0,
                                    color: Color(thirdColour),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                if (data.itemAmount(item.id) > 0)
                                  Text(
                                    'QTY: ${data.itemAmount(item.id)}',
                                  )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: InkResponse(
                          onTap: () {
                            data.removeItemFromCart(item.id);
                            Flushbar(
                              title: 'Success',
                              message: 'That item has been removed.',
                              backgroundColor: Color(successColour),
                              duration: Duration(seconds: 5),
                            )..show(context);
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Color(primaryColour),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Color(whiteColour),
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: InkResponse(
                          onTap: () {
                            data.addItemToCart(item.id, item.name, item.subtitle, item.pivot.mainPrice);
                            Flushbar(
                              title: 'Success',
                              message: 'That item has been added.',
                              backgroundColor: Color(successColour),
                              duration: Duration(seconds: 5),
                            )..show(context);
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Color(secondaryColour),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Color(whiteColour),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            width: width * 0.5,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(secondaryColour),
                  ),
                  child: Center(
                    child: Image.network(graphQLApiImg + item.image, height: 70.0, width: 70.0),
                  ),
                ),
                SizedBox(width: 10.0),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.name,
                          style: TextStyle(
                            fontFamily: primaryFont,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 2.5,
                        ),
                        item.subtitle != null ? Text(item.subtitle) : Text(''),
                        SizedBox(
                          height: 2.5,
                        ),
                        SmoothStarRating(
                          allowHalfRating: false,
                          starCount: rating.toInt(),
                          rating: rating,
                          color: Color(0xFFFFD143),
                          borderColor: Color(0xFFFFD143),
                          size: 15.0,
                          spacing: 0.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '£${item.pivot.mainPrice.toStringAsFixed(2)}',
                              style: TextStyle(fontFamily: secondaryFont),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: InkResponse(
                            onTap: () {},
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(primaryColour),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.info,
                                color: Color(whiteColour),
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: InkResponse(
                            onTap: () {},
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(secondaryColour),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Color(whiteColour),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
  );
}

void _navigateToItem(BuildContext context, Items item) {
  Navigator.pushNamed(context, ItemScreenRoute, arguments: item);
}

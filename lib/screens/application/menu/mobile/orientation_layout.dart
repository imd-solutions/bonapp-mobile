import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/hero_type.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/screens/application/menuitems/menuitem_screen.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/menu/viewmodel.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';
import '../../../../widgets/base_model_widget.dart';

class MenuMobilePortrait extends BaseModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel data) {
    final List<Items> _items = items;
    var _screenWidth = MediaQuery.of(context).size.width;

    return BusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'What would you',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(secondaryColour),
                        ),
                      ),
                      Text(
                        'like to eat today?',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(secondaryColour),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.notifications_none,
                    size: 35,
                    color: Color(accentSecondColour),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Top Sellers',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: Color(accentSecondColour),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('See All'),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color(primaryColour),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
              child: Container(
                height: 100.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCard(_items[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: Color(accentSecondColour),
                    ),
                  ),
                ],
              ),
            ),
            BannerWidgetArea(
              categories: data.menus,
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
    return Scaffold(
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        child: Text('Landscape'),
      ),
    );
  }
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
                image: AssetImage(items.imgUrl),
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
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${items.description}",
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

    PageController controller =
        PageController(viewportFraction: 1.0, initialPage: 0);

    List<Widget> banners = new List<Widget>();

    void goToNewPage(data) {
      // PageRouteBuilder
      Navigator.of(context).push(
        PageRouteBuilder(
          fullscreenDialog: true,
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return MenuItemScreen(
              heroType: HeroType(
                title: data.name,
                description: data.description,
                image: data.imgUrl,
                colour: secondaryColour,
              ),
            );
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity:
                  animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
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
                  graphQLApi + '/storage/' + categories[x].info.imgUrl,
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

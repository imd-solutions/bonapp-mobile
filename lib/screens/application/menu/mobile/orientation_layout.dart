import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/hero_type.dart';
import 'package:flutter_bonapp/screens/application/menuitems/menuitem_screen.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/menu/viewmodel.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';
import '../../../../widgets/base_model_widget.dart';

class MenuMobilePortrait extends BaseModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel data) {
    var _screenWidth = MediaQuery.of(context).size.width;

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

    return BusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        body: ListView.builder(
          itemCount: data.menus.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: GestureDetector(
                onTap: () => goToNewPage(data.menus[index].info),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 150.0,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: 'background_' + data.menus[index].info.name,
                          child: Container(
                            color: Color(secondaryColour),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Hero(
                            tag: 'imgae_' + data.menus[index].info.name,
                            child: Image.network(
                              graphQLApi + '/storage/' + data.menus[index].info.imgUrl,
                              fit: BoxFit.fitWidth,
                              height: 80.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90.0,
                          left: 10.0,
                          width: _screenWidth,
                          height: 250.0,
                          child: Text(
                            data.menus[index].info.name,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: primaryFont,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 115.0,
                          width: _screenWidth,
                          height: 120.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            width: _screenWidth,
                            child: Text(
                              data.menus[index].info.description,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: secondaryFont,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
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

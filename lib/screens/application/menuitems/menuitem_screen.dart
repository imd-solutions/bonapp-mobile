import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/hero_type.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';

class MenuItemScreen extends StatelessWidget {
  final HeroType heroType;

  MenuItemScreen({Key key, this.heroType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(heroType.title),
        backgroundColor: Color(whiteColour),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'background' + heroType.title,
              child: Container(
                color: Color(heroType.colour),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              width: _screenWidth,
              height: 230.0,
              child: Hero(
                tag: 'image' + heroType.title,
                child: Image.network(
                  graphQLApi + '/storage/' + heroType.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 170.0,
              left: 10.0,
              width: _screenWidth,
              child: Hero(
                tag: 'text' + heroType.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    heroType.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(whiteColour),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200.0,
              left: 10.0,
              width: _screenWidth - 64.0,
              child: Hero(
                tag: 'subtitle' + heroType.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    heroType.description,
                    style: TextStyle(
                      color: Color(whiteColour),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

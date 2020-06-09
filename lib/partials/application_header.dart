import 'package:flutter/material.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';

class HomeApplicationHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  HomeApplicationHeader({@required GlobalKey<ScaffoldState> scaffoldKey}) : _scaffoldKey = scaffoldKey;

  @override
  Widget build(BuildContext context) {
    CartService _cartService = locator<CartService>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          icon: Icon(Icons.menu),
        ),
        Image.asset(
          'assets/images/logo.png',
          height: 50.0,
        ),
        Stack(
          children: <Widget>[
            IconButton(
              onPressed: () => _navigateToCart(context),
              icon: Icon(Icons.shopping_cart),
            ),
            if (_cartService.itemCount > 0)
              Positioned(
                top: 5.0,
                left: 20.0,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: Center(
                    child: Text(
                      '${_cartService.itemCount}',
                      style: TextStyle(color: Color(whiteColour)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(primaryColour),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}

class ApplicationHeader extends StatelessWidget {
  const ApplicationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartService _cartService = locator<CartService>();

    return Row(
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
        Stack(
          children: <Widget>[
            IconButton(
              onPressed: () => _navigateToCart(context),
              icon: Icon(Icons.shopping_cart),
            ),
            if (_cartService.itemCount > 0)
              Positioned(
                top: 5.0,
                left: 20.0,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: Center(
                    child: Text(
                      '${_cartService.itemCount}',
                      style: TextStyle(
                        color: Color(whiteColour),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(primaryColour),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}

class CheckoutApplicationHeader extends StatelessWidget {
  const CheckoutApplicationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              height: 50.0,
            ),
          ],
        ),
        Text('')
      ],
    );
  }
}

void _navigateToCart(BuildContext context) {
  Navigator.pushNamed(context, CartScreenRoute);
}

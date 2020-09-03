import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/cart/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/checkout/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            if (_cartService.itemCount > 0) HeaderCartIcon(cartService: _cartService)
          ],
        )
      ],
    );
  }
}

class ApplicationHeader extends StatelessWidget {
  final User user;
  final String route;
  final String information;

  const ApplicationHeader({Key key, this.user, this.route, this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartService _cartService = locator<CartService>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        information != 'dashboard'
            ? IconButton(
                onPressed: () => route == null
                    ? Navigator.pushNamed(context, InitialScreenRoute, arguments: user)
                    : route == 'goback' ? Navigator.of(context).pop() : Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false),
                icon: Icon(Icons.arrow_back),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.dashboard),
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
            information != 'dashboard'
                ? IconButton(
                    onPressed: () => _navigateToCart(context),
                    icon: Icon(Icons.shopping_cart),
                  )
                : IconButton(
                    onPressed: () => _logUserOut(context),
                    icon: Icon(FontAwesomeIcons.signOutAlt),
                  ),
            if (_cartService.itemCount > 0) HeaderCartIcon(cartService: _cartService)
          ],
        )
      ],
    );
  }
}

class HeaderCartIcon extends StatelessWidget {
  const HeaderCartIcon({
    Key key,
    @required CartService cartService,
  })  : _cartService = cartService,
        super(key: key);

  final CartService _cartService;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5.0,
      left: 28.5,
      child: Container(
        width: 15.0,
        height: 15.0,
        child: Center(
          child: Text(
            '${_cartService.itemCount}',
            style: TextStyle(color: Color(whiteColour), fontSize: 10.0),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(primaryColour),
        ),
      ),
    );
  }
}

class CartApplicationHeader extends BaseModelWidget<CartViewModel> {
  final User user;
  CartApplicationHeader({this.user});

  @override
  Widget build(BuildContext context, CartViewModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () => data.itemCount > 0
              ? Navigator.of(context).pop()
              : Navigator.of(context).pushNamedAndRemoveUntil(
                  InitialScreenRoute,
                  (Route<dynamic> route) => false,
                  arguments: user,
                ),
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
        const Text('')
      ],
    );
  }
}

class CheckoutApplicationHeader extends BaseModelWidget<CheckoutViewModel> {
  final User user;
  CheckoutApplicationHeader({this.user});

  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () => data.itemCount > 0 ? Navigator.of(context).pop() : Navigator.of(context).pushNamedAndRemoveUntil(InitialScreenRoute, (Route<dynamic> route) => false, arguments: user),
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
        const Text('')
      ],
    );
  }
}

void _navigateToCart(BuildContext context) {
  Navigator.pushNamed(context, CartScreenRoute);
}

void _logUserOut(BuildContext context) {
  Navigator.pushNamed(context, LoginScreenRoute);
}

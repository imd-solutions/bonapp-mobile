import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/screens/auth/login/login_screen.dart';
import 'package:flutter_bonapp/screens/auth/register/register_screen.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/sliders/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';
import 'package:flutter_bonapp/widgets/sliders/dots.dart';
import 'package:flutter_bonapp/widgets/sliders/build.dart';

class SlidersMobilePortrait extends BaseModelWidget<SlidersViewModel> {
  final PageController _pageController = PageController(initialPage: 0);

  Widget build(BuildContext context, SlidersViewModel data) {
    int _currentPage = data.currentPage;

    var height = MediaQuery.of(context).size.height;
    var regNumber = 125.0;

    return BusyOverlay(
      show: data.state != ViewState.Completed,
      child: Scaffold(
        body: Container(
          color: Color(whiteColour),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: height > 570.0 ? 180.0 : regNumber,
                  height: height > 570.0 ? 180.0 : regNumber,
                ),
                SliderWidget(
                  pageController: _pageController,
                  height: height,
                  regNumber: regNumber,
                  currentPage: _currentPage,
                  data: data,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RegisterBtn(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Have an Account?',
                            style: TextStyle(
                              color: Color(blackColour),
                              fontSize: 18.0,
                              fontFamily: secondaryFont,
                            ),
                          ),
                          LoginBtn()
                        ],
                      )
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

class SlidersMobileLandscape extends BaseModelWidget<SlidersViewModel> {
  final PageController _pageController = PageController(initialPage: 0);

  Widget build(BuildContext context, SlidersViewModel data) {
    int _currentPage = data.currentPage;

    var height = MediaQuery.of(context).size.height;
    var regNumber = 65.0;

    return BusyOverlay(
      show: data.state != ViewState.Completed,
      child: Scaffold(
        body: Container(
          color: Color(whiteColour),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: height > 570.0 ? 180.0 : regNumber,
                  height: height > 570.0 ? 180.0 : regNumber,
                ),
                SliderWidget(
                  pageController: _pageController,
                  height: height,
                  regNumber: regNumber,
                  currentPage: _currentPage,
                  data: data,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[RegisterBtn(), LoginBtn()],
                      )
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

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10.00),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      },
      child: Text(
        'Get Started',
        style: TextStyle(
          fontSize: 18.0,
          color: Color(whiteColour),
          fontFamily: secondaryFont,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Color(primaryColour),
    );
  }
}

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      },
      child: Text(
        'Login',
        style: TextStyle(
          color: Color(accentSecondColour),
          fontSize: 18.0,
          fontFamily: secondaryFont,
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  final PageController _pageController;
  final double height;
  final double regNumber;
  final int _currentPage;
  final SlidersViewModel data;

  const SliderWidget({
    Key key,
    @required PageController pageController,
    @required this.height,
    @required this.regNumber,
    @required int currentPage,
    this.data,
  })  : _pageController = pageController,
        _currentPage = currentPage,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          BuildSliders(
            pageController: _pageController,
            data: data,
            height: height,
            imageHeight: regNumber,
            imageWidth: regNumber,
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: height > 570.0 ? 15.0 : 5.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < data.sliders.length; i++) if (i == _currentPage) SliderDots(true) else SliderDots(false),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/screens/auth/login/login_screen.dart';
import 'package:flutter_bonapp/screens/sliders/sliders_screen.dart';
import 'package:flutter_bonapp/viewmodels/introscreen/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class IntroScreenMobilePortrait extends BaseModelWidget<IntroScreenViewModel> {
  @override
  Widget build(BuildContext context, IntroScreenViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: SplashScreen(
                  seconds: 8,
                  navigateAfterSeconds: data.userID != null ? LoginScreen() : SlidersScreen(),
                  title: Text(
                    'Catering is our business and we excel at it.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      fontFamily: secondaryFont,
                    ),
                  ),
                  image: Image.asset('assets/images/logo.png'),
                  backgroundColor: Color(whiteColour),
                  photoSize: height > 570.0 ? 85.0 : 50.0,
                  onClick: () {},
                  loaderColor: Color(primaryColour),
                  loadingText: Text(
                    'Loading app...',
                    style: TextStyle(
                      fontFamily: secondaryFont,
                      color: Color(primaryColour),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

class IntroScreenMobileLandscape extends BaseModelWidget<IntroScreenViewModel> {
  @override
  Widget build(BuildContext context, IntroScreenViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: SplashScreen(
                  seconds: 8,
                  navigateAfterSeconds: data.userID > 0 ? LoginScreen() : SlidersScreen(),
                  title: Text(
                    'Catering is our business and we excel at it.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      fontFamily: secondaryFont,
                    ),
                  ),
                  image: Image.asset('assets/images/logo.png'),
                  backgroundColor: Color(whiteColour),
                  photoSize: height > 570.0 ? 85.0 : 50.0,
                  onClick: () {},
                  loaderColor: Color(primaryColour),
                  loadingText: Text(
                    'Loading app...',
                    style: TextStyle(
                      fontFamily: secondaryFont,
                      color: Color(primaryColour),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

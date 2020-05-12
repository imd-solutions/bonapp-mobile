import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/screens/sliders/sliders_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_resp_mvvm/utils/constants.dart';
import 'package:flutter_resp_mvvm/partials/application_footer.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: SplashScreen(
            seconds: 8,
            navigateAfterSeconds: SlidersScreen(),
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
                fontFamily: 'Raleway',
                color: Color(primaryColour),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ApplicationFooter(
            name: 'Bon Appetit',
            version: '0.0.1',
          ),
        )
      ],
    );
  }
}

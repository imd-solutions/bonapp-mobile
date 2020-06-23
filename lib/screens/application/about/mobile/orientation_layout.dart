import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/about/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutMobilePortrait extends BaseModelWidget<AboutViewModel> {
  @override
  Widget build(BuildContext context, AboutViewModel data) {
    return Scaffold(
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  ApplicationHeader(route: 'goback'),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (data.state != ViewState.Busy)
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data.page.title,
                            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: primaryFont, letterSpacing: 1.5,),
                          ),
                        ),
                        Html(
                          data: """${data.page.body}""",
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AboutMobileLandscape extends BaseModelWidget<AboutViewModel> {
  @override
  Widget build(BuildContext context, AboutViewModel data) {
    return Scaffold(
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  ApplicationHeader(route: 'goback'),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (data.state != ViewState.Busy)
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data.page.title,
                            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: primaryFont, letterSpacing: 1.5,),
                          ),
                        ),
                        Html(
                          data: """${data.page.body}""",
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

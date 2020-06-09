import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/about/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class AboutTabletPortrait extends BaseModelWidget<AboutViewModel> {
  @override
  Widget build(BuildContext context, AboutViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
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
                  IconButton(
                    onPressed: () => print('Alert Bar'),
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutTabletLandscape extends BaseModelWidget<AboutViewModel> {
  @override
  Widget build(BuildContext context, AboutViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
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
                  IconButton(
                    onPressed: () => print('Alert Bar'),
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

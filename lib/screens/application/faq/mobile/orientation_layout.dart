import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/faq.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/faq/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

class FaqMobilePortrait extends BaseModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel data) {
    return Scaffold(
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                ApplicationHeader(),
                SizedBox(
                  height: 20.0,
                ),
                if (data.state != ViewState.Busy)
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.allFaqs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildFaqTiles(data.allFaqs[index]);
                      },
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

class FaqMobileLandscape extends BaseModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel data) {
    return Scaffold(
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                ApplicationHeader(),
                SizedBox(
                  height: 20.0,
                ),
                if (data.state != ViewState.Busy)
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.allFaqs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildFaqTiles(data.allFaqs[index]);
                      },
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

Widget _buildFaqTiles(Faq faq) {
  return ExpansionTile(
    title: Text(
      faq.question,
      style: TextStyle(
        fontSize: 13.0,
        fontFamily: primaryFont,
        color: Color(primaryColour),
      ),
    ),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                faq.answer,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: secondaryFont,
                  fontSize: 15.0,
                  color: Color(accentSecondColour),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      )
    ],
  );
}

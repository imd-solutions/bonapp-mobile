import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/reward/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';

class RewardMobilePortrait extends BaseModelWidget<RewardViewModel> {
  @override
  Widget build(BuildContext context, RewardViewModel data) {
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : Column(
            children: <Widget>[
              VoucherHeader(
                count: data.user.vouchers.length,
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (var i = 0; i < data.user.vouchers.length; i++)
                      VoucherFlip(
                        name: data.user.vouchers[i].name,
                        subTitle: data.user.vouchers[i].subTitle,
                        code: data.user.vouchers[i].code,
                        qrcode: data.user.vouchers[i].qrcode,
                      ),
                  ],
                ),
              )
            ],
          );
  }
}

class RewardMobileLandscape extends BaseModelWidget<RewardViewModel> {
  @override
  Widget build(BuildContext context, RewardViewModel data) {
    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: Text(''),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              VoucherHeader(
                count: data.user.vouchers.length,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    for (var i = 0; i < data.user.vouchers.length; i++)
                      VoucherFlip(
                        name: data.user.vouchers[i].name,
                        subTitle: data.user.vouchers[i].subTitle,
                        code: data.user.vouchers[i].code,
                        qrcode: data.user.vouchers[i].qrcode,
                      ),
                  ],
                ),
              )
            ],
          );
  }
}

class VoucherHeader extends StatelessWidget {
  final int count;

  VoucherHeader({this.count});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[
              Text(
                "Vouchers",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(blackColour),
                  fontFamily: primaryFont,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              count > 0
                  ? Container(
                      width: width * 0.7,
                      child: Text(
                        "Tap to reveal the discount code.",
                        style: TextStyle(fontSize: 15.0, color: Color(blackColour), fontFamily: primaryFont),
                      ),
                    )
                  : Container(
                      width: width * 0.9,
                      child: Text(
                        'You do not have any vouchers at this time. Gather more drink/food stamps.',
                        style: TextStyle(fontSize: 15.0, color: Color(blackColour), fontFamily: primaryFont),
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class VoucherFlip extends StatelessWidget {
  final String name;
  final String subTitle;
  final String code;
  final String qrcode;

  const VoucherFlip({@required this.name, @required this.subTitle, @required this.code, @required this.qrcode});

  @override
  Widget build(BuildContext context) {
    var _orientation = MediaQuery.of(context).orientation;
    return Column(
      children: <Widget>[
        FlipCard(
            front: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    width: 350.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/voucher_background.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: _orientation == Orientation.landscape ? 60.0 : 0.00, right: _orientation == Orientation.portrait ? 80.0 : 0.00),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(whiteColour),
                          fontSize: 25.0,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: primaryFont,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0, left: _orientation == Orientation.landscape ? 60.0 : 0.00, right: _orientation == Orientation.portrait ? 80.0 : 0.00),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(whiteColour),
                          fontSize: 50.0,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cookie',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            back: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$qrcode'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    padding: const EdgeInsets.only(top: 60.0, left: 60.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'CODE:',
                                style: TextStyle(
                                  color: Color(blackColour),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'secondaryFont',
                                ),
                              ),
                              Text(
                                '$code',
                                style: TextStyle(
                                  color: Color(blackColour),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'secondaryFont',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}

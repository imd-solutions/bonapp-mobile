import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/loyalty/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';

final _controller = new PageController();
const _kDuration = const Duration(milliseconds: 300);
const _kCurve = Curves.ease;

class LoyaltyMobilePortrait extends BaseModelWidget<LoyaltyViewModel> {
  @override
  Widget build(BuildContext context, LoyaltyViewModel data) {
    var _height = MediaQuery.of(context).size.height;

    List<Widget> _listPages = [
      if (data.state != ViewState.Busy)
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              width: 470.0,
              height: _height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/coffee_free_message.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              height: _height * 0.55,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(10.0),
                      width: 140.0,
                      height: 165.0,
                      decoration: BoxDecoration(
                        image: index == 8
                            ? DecorationImage(
                                image: data.user.profile.drinkStamp > index ? AssetImage('assets/images/coffee_free_stamp.png') : AssetImage('assets/images/coffee_free.png'),
                                fit: BoxFit.fill,
                              )
                            : DecorationImage(
                                image: data.user.profile.drinkStamp > index ? AssetImage('assets/images/coffee_free_${index}_stamp.png') : AssetImage('assets/images/coffee_free_$index.png'),
                                fit: BoxFit.fill,
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      if (data.state != ViewState.Busy)
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              width: 470.0,
              height: _height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/lunch_free_message.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              height: _height * 0.55,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(10.0),
                      width: 140.0,
                      height: 165.0,
                      decoration: BoxDecoration(
                        image: index == 8
                            ? DecorationImage(
                                image: data.user.profile.foodStamp > index ? AssetImage('assets/images/lunch_free_stamp.png') : AssetImage('assets/images/lunch_free.png'),
                                fit: BoxFit.fill,
                              )
                            : DecorationImage(
                                image: data.user.profile.foodStamp > index ? AssetImage('assets/images/lunch_free_${index}_stamp.png') : AssetImage('assets/images/lunch_free_$index.png'),
                                fit: BoxFit.fill,
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
    ];

    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: const Text(''),
          )
        : Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: data.initial == 'drinks' ? Color(primaryColour) : Color(accentThirdColour),
                      onPressed: () {
                        data.selectPage('drinks');
                        _controller.previousPage(duration: _kDuration, curve: _kCurve);
                      },
                      child: Text(
                        'Drinks',
                        style: TextStyle(
                          color: data.initial == 'drinks' ? Color(whiteColour) : Color(accentSecondColour),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: data.initial == 'food' ? Color(primaryColour) : Color(accentThirdColour),
                      onPressed: () {
                        data.selectPage('food');
                        _controller.nextPage(duration: _kDuration, curve: _kCurve);
                      },
                      child: Text(
                        'Food',
                        style: TextStyle(
                          color: data.initial == 'food' ? Color(whiteColour) : Color(accentSecondColour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: _height * 0.9,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: _listPages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _listPages[index];
                  },
                ),
              )
            ],
          );
  }
}

class LoyaltyMobileLandscape extends BaseModelWidget<LoyaltyViewModel> {
  @override
  Widget build(BuildContext context, LoyaltyViewModel data) {
    var _height = MediaQuery.of(context).size.height;

    List<Widget> _listPages = [
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              width: 470.0,
              height: _height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/coffee_free_message.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          if (data.state != ViewState.Busy)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                height: _height,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                    9,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        width: 140.0,
                        height: 165.0,
                        decoration: BoxDecoration(
                          image: index == 8
                              ? DecorationImage(
                                  image: data.user.profile.drinkStamp > index ? AssetImage('assets/images/coffee_free_stamp.png') : AssetImage('assets/images/coffee_free.png'),
                                  fit: BoxFit.fill,
                                )
                              : DecorationImage(
                                  image: data.user.profile.drinkStamp > index ? AssetImage('assets/images/coffee_free_${index}_stamp.png') : AssetImage('assets/images/coffee_free_$index.png'),
                                  fit: BoxFit.fill,
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              width: 470.0,
              height: _height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/lunch_free_message.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          if (data.state != ViewState.Busy)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                height: _height,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                    9,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        width: 140.0,
                        height: 165.0,
                        decoration: BoxDecoration(
                          image: index == 8
                              ? DecorationImage(
                                  image: data.user.profile.foodStamp > index ? AssetImage('assets/images/lunch_free_stamp.png') : AssetImage('assets/images/lunch_free.png'),
                                  fit: BoxFit.fill,
                                )
                              : DecorationImage(
                                  image: data.user.profile.foodStamp > index ? AssetImage('assets/images/lunch_free_${index}_stamp.png') : AssetImage('assets/images/lunch_free_$index.png'),
                                  fit: BoxFit.fill,
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    ];

    return data.state == ViewState.Busy
        ? BusyOverlay(
            show: data.state == ViewState.Busy,
            child: const Text(''),
          )
        : Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: data.initial == 'drinks' ? Color(primaryColour) : Color(accentThirdColour),
                      onPressed: () {
                        data.selectPage('drinks');
                        _controller.previousPage(duration: _kDuration, curve: _kCurve);
                      },
                      child: Text(
                        'Drinks',
                        style: TextStyle(
                          color: data.initial == 'drinks' ? Color(whiteColour) : Color(accentSecondColour),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: data.initial == 'food' ? Color(primaryColour) : Color(accentThirdColour),
                      onPressed: () {
                        data.selectPage('food');
                        _controller.nextPage(duration: _kDuration, curve: _kCurve);
                      },
                      child: Text(
                        'Food',
                        style: TextStyle(
                          color: data.initial == 'food' ? Color(whiteColour) : Color(accentSecondColour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: _height * 0.9,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: _listPages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _listPages[index];
                  },
                ),
              )
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_resp_mvvm/utils/env.dart';
import 'package:flutter_resp_mvvm/models/sliders.dart';

class FullList extends StatelessWidget {
  final Sliders sliders;

  FullList({this.sliders});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            image: DecorationImage(
                image: NetworkImage(graphQLApi + sliders.imgUrl),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                sliders.title,
                style: TextStyle(
                    color: Colors.white, fontSize: 35.0, fontFamily: 'Raleway'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                sliders.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'BalooPaaji2',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

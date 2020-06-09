import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/order/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';
import 'package:intl/intl.dart';

class OrderMobilePortrait extends BaseModelWidget<OrderViewModel> {
  @override
  Widget build(BuildContext context, OrderViewModel data) {
    return Scaffold(
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ApplicationHeader(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Order Details Page",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(blackColour),
                        fontFamily: primaryFont,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              if (data.state != ViewState.Busy)
                Expanded(
                  child: ListView.builder(
                    itemCount: data.userOrder.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildOrderTiles(data.userOrder[index]);
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderMobileLandscape extends BaseModelWidget<OrderViewModel> {
  @override
  Widget build(BuildContext context, OrderViewModel data) {
    return Scaffold(
      body: FullBusyOverlay(
        show: data.state == ViewState.Busy,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ApplicationHeader(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Order Details Page",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(blackColour),
                        fontFamily: primaryFont,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              if (data.state != ViewState.Busy)
                Expanded(
                  child: ListView.builder(
                    itemCount: data.userOrder.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildOrderTiles(data.userOrder[index]);
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOrderTiles(Order order) {
  return ExpansionTile(
    title: Row(
      children: <Widget>[
        OrderHeadlineStyle(
          title: 'Date: ',
          data: '${DateFormat("dd/MM/yyyy").format(DateTime.parse(order.createdAt.toString()))}',
        ),
        Spacer(),
        OrderHeadlineStyle(
          title: 'Total: ',
          data: '£${order.billingTotal.toStringAsFixed(2)}',
        ),
      ],
    ),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OrderHeadlineStyle(
                title: 'Order Number:',
                data: '#${order.id} ',
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'QTY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Item',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 45.0,
                  ),
                  Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              for (var i = 0; i < order.items.length; i++)
                Row(
                  children: <Widget>[
                    Text('${order.items[i].pivot.quantity}x'),
                    SizedBox(
                      width: 25.0,
                    ),
                    Text('${order.items[i].name}'),
                    Spacer(),
                    Text('£${order.items[i].pivot.price.toStringAsFixed(2)}'),
                    Spacer(),
                    Text('£${order.items[i].pivot.totalPrice.toStringAsFixed(2)}'),
                  ],
                ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    'Subtotal: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Text('£6.00'),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    'Tax: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('£1.20'),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    'Total: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('£7.20'),
                ],
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

class OrderHeadlineStyle extends StatelessWidget {
  final String title;
  final String data;

  OrderHeadlineStyle({@required this.title, @required this.data});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: primaryFont,
          color: Color(accentColour),
        ),
        children: <TextSpan>[
          TextSpan(
            text: data,
            style: TextStyle(
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
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
              ApplicationHeader(user: data.user),
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
                  child: data.userOrder.length < 1
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'You do not have any orders.',
                              style: TextStyle(fontFamily: secondaryFont),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.userOrder.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildOrderTiles(context, data.userOrder[index], data);
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
              ApplicationHeader(user: data.user),
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
                  child: data.userOrder.length < 1
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'You do not have any orders.',
                              style: TextStyle(fontFamily: secondaryFont),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.userOrder.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildOrderTiles(context, data.userOrder[index], data);
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

Widget _buildOrderTiles(BuildContext context, Order order, OrderViewModel data) {
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
                  Text('£${order.billingSubtotal.toStringAsFixed(2)}'),
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
                  Text('£${order.billingTax.toStringAsFixed(2)}'),
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
                  Text('£${order.billingTotal.toStringAsFixed(2)}'),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _showOrderMessage(context, order, data),
                    color: Color(primaryColour),
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Color(whiteColour),
                      ),
                    ),
                  ),
                  Spacer(),
                  if (order.status != 'COMPLETED')
                    RaisedButton(
                      onPressed: () {
                        data.orderReceived(int.parse(order.id)).then((message) {
                          Flushbar(
                            title: message.title,
                            message: message.message.replaceAll('Exception: ', ''),
                            backgroundColor: Color(message.colour),
                            duration: Duration(seconds: message.status != 200 ? 7 : 3),
                          )..show(context).then(
                              (_) {
                                // Send the user to the Initial Application Screen on success.
                                if (message.status == 200) {
                                  Navigator.pushNamed(context, OrdersScreenRoute);
                                }
                              },
                            );
                        });
                      },
                      color: Color(successColour),
                      child: Text(
                        'Order Received',
                        style: TextStyle(
                          color: Color(whiteColour),
                        ),
                      ),
                    )
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

Widget getTextField(String inputBoxName, String inputHintBox, TextEditingController inputBoxController) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: inputBoxController,
      decoration: InputDecoration(
        hintText: inputHintBox,
        labelText: inputBoxName,
      ),
    ),
  );
}

void _showOrderMessage(BuildContext context, Order order, OrderViewModel data) {
  final _formKey = GlobalKey<FormState>();
  final teOrderId = TextEditingController();
  final teOrderMessage = TextEditingController();

  if (order != null) {
    teOrderId.text = order.id;
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Contact us.'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getTextField("Message", 'Your Message', teOrderMessage),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(primaryColour),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(primaryColour),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _sendMessage(context, teOrderId.text, teOrderMessage.text, data);
                        }
                      },
                      child: Container(
                        height: 25.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(primaryColour),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                              color: Color(primaryColour),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _sendMessage(BuildContext context, String oid, String orderMessage, OrderViewModel data) {
  data.sendOrderMessage(oid, orderMessage).then((message) => {
        Flushbar(
          title: message.title,
          message: message.message.replaceAll('Exception: ', ''),
          backgroundColor: Color(message.colour),
          duration: Duration(seconds: message.status != 200 ? 7 : 3),
        )..show(context).then(
            (_) {
              // Send the user to the Initial Application Screen on success.
              if (message.status == 200) {
                Navigator.pop(context);
              }
            },
          )
      });
}

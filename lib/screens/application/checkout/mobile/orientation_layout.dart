import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/includes/select/branch_dropdown.dart';
import 'package:flutter_bonapp/includes/select/delivery_dropdown.dart';
import 'package:flutter_bonapp/partials/application_header.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/routing_constants.dart';
import 'package:flutter_bonapp/viewmodels/checkout/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/full_busy_overlay.dart';

class CartItems {
  String number;
  String text;
  String secondaryText;
  String amount;
  CartItems({@required this.number, @required this.text, @required this.secondaryText, @required this.amount});
}

class CheckoutMobilePortrait extends BaseModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    TextEditingController _controller = new TextEditingController();

    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        backgroundColor: Color(whiteColour),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CheckoutApplicationHeader(),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: primaryFont,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.builder(
                        itemCount: data.items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var name = data.items.values.toList()[index].name;
                          var subtitle = data.items.values.toList()[index].subtitle;
                          var price = data.items.values.toList()[index].price;
                          var qty = data.items.values.toList()[index].quantity;
                          var total = price * qty;

                          return Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Center(
                                      child: Text(
                                        qty.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          fontFamily: secondaryFont,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  const Text('x'),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '$name (£${price.toStringAsFixed(2)})',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: secondaryFont,
                                          ),
                                        ),
                                        if (subtitle != null)
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                subtitle,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color(accentThirdColour),
                                                ),
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '£${total.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Color(secondaryColour),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: secondaryFont,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                thickness: 1.0,
                                color: Color(accentThirdColour),
                                height: 1.0,
                              ),
                              SizedBox(
                                height: 14.0,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total:',
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '£${data.cartSubTotal.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if (data.state != ViewState.Busy)
                        data.user.profile.location.branches.length > 0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  const Text('Collection or Delivery'),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  BranchDropdown(
                                    selectedTitle: 'Collection at ${data.user.profile.location.name}',
                                    selected: data.branchDropdown,
                                    data: data.user.profile.location.branches,
                                    updateSelected: (val) {
                                      data.updateBranchDropdown(val);
                                      if (val > 0) {
                                        data.getDeliveryTimes(val);
                                      }
                                    },
                                  ),
                                  if (data.branchDropdown > 0)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        const Text('Please select a delivery time.'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        data.state != ViewState.DoingSomething
                                            ? DeliveryDropdown(
                                                selectedTitle: 'Delivery time',
                                                selected: data.deliveryDropdown,
                                                data: data.deliveries,
                                                updateSelected: (val) {
                                                  data.updateDeliveryDropdown(val);
                                                },
                                              )
                                            : Center(
                                                child: CircularProgressIndicator(
                                                  backgroundColor: Color(primaryColour),
                                                  strokeWidth: 2,
                                                ),
                                              ),
                                      ],
                                    )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Pickup',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        data.user.profile.location.name,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color(accentThirdColour),
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      SizedBox(
                        height: 15.0,
                      ),
                      const Text('Special Instructions:'),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextField(
                        controller: _controller,
                        onChanged: (text) => data.updateSpecialInstructions(text),
                        autofocus: true,
                        cursorColor: Color(primaryColour),
                        style: TextStyle(height: 1.0),
                        cursorWidth: 2.0,
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          hintText: "Please add any special instructions here.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                      ), //
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 80.0,
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    child: submitOrder(data, context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutMobileLandscape extends BaseModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel data) {
    TextEditingController _controller = new TextEditingController();
    return FullBusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        backgroundColor: Color(whiteColour),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CheckoutApplicationHeader(),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: primaryFont,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.builder(
                        itemCount: data.items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var name = data.items.values.toList()[index].name;
                          var subtitle = data.items.values.toList()[index].subtitle;
                          var price = data.items.values.toList()[index].price;
                          var qty = data.items.values.toList()[index].quantity;
                          var total = price * qty;

                          return Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Center(
                                      child: Text(
                                        qty.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          fontFamily: secondaryFont,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  const Text('x'),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '$name (£${price.toStringAsFixed(2)})',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: secondaryFont,
                                          ),
                                        ),
                                        if (subtitle != null)
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                subtitle,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color(accentThirdColour),
                                                ),
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '£${total.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Color(secondaryColour),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: secondaryFont,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                thickness: 1.0,
                                color: Color(accentThirdColour),
                                height: 1.0,
                              ),
                              SizedBox(
                                height: 14.0,
                              ),
                            ],
                          );
                        },
                      ), //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total:',
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '£${data.cartSubTotal.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if (data.state != ViewState.Busy)
                        data.user.profile.location.branches.length > 0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  const Text('Collection or Delivery'),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  BranchDropdown(
                                    selectedTitle: 'Collection at ${data.user.profile.location.name}',
                                    selected: data.branchDropdown,
                                    data: data.user.profile.location.branches,
                                    updateSelected: (val) {
                                      data.updateBranchDropdown(val);
                                      if (val > 0) {
                                        data.getDeliveryTimes(val);
                                      }
                                    },
                                  ),
                                  if (data.branchDropdown > 0)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        const Text('Please select a delivery time.'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        data.state != ViewState.DoingSomething
                                            ? DeliveryDropdown(
                                                selectedTitle: 'Delivery time',
                                                selected: data.deliveryDropdown,
                                                data: data.deliveries,
                                                updateSelected: (val) {
                                                  data.updateDeliveryDropdown(val);
                                                },
                                              )
                                            : Center(
                                                child: CircularProgressIndicator(
                                                  backgroundColor: Color(primaryColour),
                                                  strokeWidth: 2,
                                                ),
                                              ),
                                      ],
                                    )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Pickup',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        data.user.profile.location.name,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color(accentThirdColour),
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      SizedBox(
                        height: 15.0,
                      ),
                      const Text('Special Instructions:'),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextField(
                        controller: _controller,
                        onChanged: (text) => data.updateSpecialInstructions(text),
                        autofocus: true,
                        cursorColor: Color(primaryColour),
                        style: TextStyle(height: 1.0),
                        cursorWidth: 2.0,
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          hintText: "Please add any special instructions here.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                      ), //
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 80.0,
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    child: submitOrder(data, context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

FlatButton submitOrder(CheckoutViewModel data, BuildContext context) {
  List orderItems = [];
  Map itemDetails = Map<dynamic, dynamic>();

  return FlatButton(
    onPressed: data.state == ViewState.Processing
        ? null
        : () {
            var total = data.cartSubTotal * 100;

            for (var i = 0; i < data.items.length; i++) {
              orderItems = data.items.values
                  .map((e) => itemDetails = {
                        "menuitem_id": e.id,
                        "quantity": e.quantity,
                        "price": e.price,
                        "total_price": e.price * e.quantity,
                      })
                  .toList();
            }

            data.payWithNewCard(data.user.id, total.round().toString(), orderItems, data.branchDropdown, data.deliveryDropdown, data.specialInstructions).then(
                  (message) => {
                    if (message.success == true)
                      {
                        Flushbar(
                          title: 'Success',
                          message: 'That order has been processed successfully. Thank you',
                          backgroundColor: Color(successColour),
                          duration: Duration(seconds: 7),
                        )..show(context).then(
                            (_) {
                              Navigator.of(context).pushNamedAndRemoveUntil(InitialScreenRoute, (Route<dynamic> route) => false, arguments: data.user);
                            },
                          )
                      }
                  },
                );
          },
    child: data.state == ViewState.Processing
        ? Text('Processing...', style: TextStyle(color: Color(primaryColour), fontWeight: FontWeight.bold))
        : Text(
            'SUBMIT ORDER',
            style: TextStyle(color: Color(whiteColour), fontWeight: FontWeight.bold),
          ),
    color: Color(primaryColour),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

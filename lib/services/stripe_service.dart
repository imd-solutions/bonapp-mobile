import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/order_service.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  Message success;
  OrderService orderService = locator<OrderService>();
  static String apiBase = 'https://api.stripe.com/v1';
  String paymentApiUrl = '$apiBase/payment_intents';
  static String secret = 'sk_test_51H08VyCSEoLCehu7iRTVtZN0pCmwyESIX9hXMFyruJ8rq1iyCP951hishQn7xywTmmcez8229LtRwrdwvw3iUODr00qm3Rmxgz';
  Map<String, String> headers = {'Authorization': 'Bearer $secret', 'Content-Type': 'application/x-www-form-urlencoded'};

  init() {
    StripePayment.setOptions(
      StripeOptions(publishableKey: "pk_test_51H08VyCSEoLCehu761KZb92jv0wTJWVA7xkN8eDEkgySThx9gaNsjUYrKFeG0dfAq2rVJvMLKUL9bnlgUSj3MHkw00kWNvAVYG", merchantId: "Test", androidPayMode: 'test'),
    );
  }

  Future<StripeTransactionResponse> payViaExistingCard({String amount, String currency, CreditCard card}) async {
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(PaymentMethodRequest(card: card));
      var paymentIntent = await createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(clientSecret: paymentIntent['client_secret'], paymentMethodId: paymentMethod.id));
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(message: 'Transaction successful', success: true);
      } else {
        return new StripeTransactionResponse(message: 'Transaction failed', success: false);
      }
    } on PlatformException catch (err) {
      return getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(message: 'Transaction failed: ${err.toString()}', success: false);
    }
  }

  Future<StripeTransactionResponse> payWithNewCard({String amount, String currency, int userId, orderItems}) async {
    try {
      var result = await orderService.processOrder(userId, orderItems);

      if (result.status != 200) {
        throw new Exception('Order was not created.');
      }

      var paymentMethod = await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest());
      var paymentIntent = await createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(clientSecret: paymentIntent['client_secret'], paymentMethodId: paymentMethod.id));

      if (response.status == 'succeeded') {
        success = await orderService.updateOrder(int.parse(result.message), response);

        return new StripeTransactionResponse(message: 'Transaction successful', success: true);
      } else {
        return new StripeTransactionResponse(message: 'Transaction failed', success: false);
      }
    } on PlatformException catch (err) {
      return getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(message: 'Transaction failed: ${err.toString()}', success: false);
    }
  }

  getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(message: message, success: false);
  }

  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {'amount': amount, 'currency': currency, 'payment_method_types[]': 'card'};
      var response = await http.post(paymentApiUrl, body: body, headers: headers);
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }
}

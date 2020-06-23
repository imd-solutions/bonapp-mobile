import 'package:flutter_bonapp/api/mutations/order_mutation.dart';
import 'package:flutter_bonapp/api/queries/order_query.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/config/graphql.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

OrderQuery orderQuery = OrderQuery();
OrderMutation orderMutation = OrderMutation();

class OrderService {
  Future<List<Order>> getAllUserOrders(int uid) async {
    GraphQLClient _order = graphQLConfiguration.clientToQuery();
    QueryResult response = await _order.query(
      QueryOptions(
          documentNode: gql(
            orderQuery.getUserOrders(),
          ),
          variables: {"uid": uid}),
    );

    if (response.hasException) {
      throw new Exception(response.exception.toString());
    }

    final result = response.data;

    Iterable list = result['userOrders'];

    return list.map((message) => Order.fromJson(message)).toList();
  }

  Future<Message> sendOrderMessage(String oid, String message) async {
    try {
      GraphQLClient _order = graphQLConfiguration.clientToQuery();
      QueryResult response = await _order.mutate(
          MutationOptions(
            documentNode: gql(
              orderMutation.sendOrderMessage(),
            ),
            variables: {
                "order_id": int.parse(oid),
                "message": message,
            },
          ),
      );

      if (response.hasException) {
        throw new Exception(response.exception.toString());
      }

      final result = response.data;

      return Message(
        title: 'Success',
        status: 200,
        message: result['orderReceived']['message'],
        colour: successColour,
      );
    } catch (e) {
      return Message(
        title: 'Error',
        status: 200,
        message: e.toString(),
        colour: warningColour,
      );
    }
  }

  Future<Message> orderReceived(int oid) async {
    try {
      GraphQLClient _order = graphQLConfiguration.clientToQuery();
      QueryResult response = await _order.mutate(
        MutationOptions(
          documentNode: gql(
            orderMutation.orderReceived(),
          ),
          variables: {
            "order_id": oid,
          },
        ),
      );

      if (response.hasException) {
        throw new Exception(response.exception.toString());
      }

      final result = response.data;

      return Message(
        title: 'Success',
        status: 200,
        message: result['orderReceived']['message'],
        colour: successColour,
      );
    } catch (e) {
      return Message(
        title: 'Error',
        status: 200,
        message: e.toString(),
        colour: warningColour,
      );
    }
  }
}

import 'package:flutter_bonapp/api/queries/order_query.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/config/graphql.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

OrderQuery orderQuery = OrderQuery();

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
}

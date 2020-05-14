import "package:flutter/material.dart";
import 'package:flutter_bonapp/utils/env.dart';
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: "$graphQLApi/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}

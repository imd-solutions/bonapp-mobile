import 'package:flutter_bonapp/api/queries/legal_query.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/models/legal.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

LegalQuery legalQuery = LegalQuery();

class LegalService {
  Future<List<Legal>> getLegalsOrder() async {
    GraphQLClient _legals = graphQLConfiguration.clientToQuery();
    QueryResult response = await _legals.query(
      QueryOptions(
        documentNode: gql(
          legalQuery.getLegalOrder(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['legalsOrder'];

    return list.map((legal) => Legal.fromJson(legal)).toList();
  }

}
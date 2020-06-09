import 'package:flutter_bonapp/api/queries/faq_query.dart';
import 'package:flutter_bonapp/models/faq.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/config/graphql.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

FaqQuery faqQuery = FaqQuery();

class FaqService {
  Future<List<Faq>> getActiveFAQ() async {
    GraphQLClient _faqs = graphQLConfiguration.clientToQuery();
    QueryResult response = await _faqs.query(
      QueryOptions(
        documentNode: gql(
          faqQuery.getActiveFAQ(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['activeFaq'];

    return list.map((faq) => Faq.fromJson(faq)).toList();
  }
}

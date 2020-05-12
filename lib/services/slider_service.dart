import 'package:flutter_resp_mvvm/models/sliders.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './../config/graphql.dart';
import './../api/queries/slider_query.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

SliderQuery sliderQuery = SliderQuery();

class SliderService {
  Future<List<Sliders>> getSliders() async {
    GraphQLClient _sliders = graphQLConfiguration.clientToQuery();
    QueryResult response = await _sliders
        .query(QueryOptions(documentNode: gql(sliderQuery.getSliders())));

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['sliders'];

    return list.map((slider) => Sliders.fromJson(slider)).toList();
  }
}

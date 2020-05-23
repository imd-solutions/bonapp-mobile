import 'package:flutter_bonapp/api/queries/offer_query.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/models/offer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

OfferQuery offerQuery = OfferQuery();

class OfferService {

  Future<List<Offer>> getOffers() async {
    GraphQLClient _posts = graphQLConfiguration.clientToQuery();
    QueryResult response = await _posts.query(
      QueryOptions(
        documentNode: gql(
          offerQuery.getOffers(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['offers'];

    return list.map((offer) => Offer.fromJson(offer)).toList();
  }

  Future<Offer> getOffer(id) async {
    GraphQLClient _sliders = graphQLConfiguration.clientToQuery();
    QueryResult response = await _sliders.query(
      QueryOptions(
        documentNode: gql(
          offerQuery.getOffer(),
        ),
        variables: {"id": id},
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    return Offer(
      name:  result['offer']['name'],
      description:  result['offer']['description'],
      image: result['offer']['imgUrl'],
      status: result['offer']['status'],
    );
  }

}
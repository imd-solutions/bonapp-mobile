import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/api/queries/menu_query.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

MenuQuery menuQuery = MenuQuery();

class MenuService {
  // Get all the menu items.
  Future<List<Menu>> getMenus() async {
    GraphQLClient _menu = graphQLConfiguration.clientToQuery();
    QueryResult response = await _menu.query(
      QueryOptions(
        documentNode: gql(
          menuQuery.getMenus(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get setting data.');
    }

    final result = response.data;

    Iterable list = result['menucategories'];

    return list.map((menu) => Menu.fromJson(menu)).toList();
  }

  // Get featured Items.
  Future<List<Items>> getFeaturedItems() async {
    GraphQLClient _items = graphQLConfiguration.clientToQuery();
    QueryResult response = await _items.query(
      QueryOptions(
        documentNode: gql(
          menuQuery.getFeaturedItems(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get setting data.');
    }

    final result = response.data;

    Iterable list = result['menuitemFeatured'];

    return list.map((menu) => Items.fromJson(menu)).toList();
  }

  // Get featured Items.
  Future<List<Items>> getPickOfDayItems() async {
    GraphQLClient _items = graphQLConfiguration.clientToQuery();
    QueryResult response = await _items.query(
      QueryOptions(
        documentNode: gql(
          menuQuery.getPickOfDayItems(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get menu data.');
    }

    final result = response.data;

    Iterable list = result['menuitemPickOfDay'];

    return list.map((menu) => Items.fromJson(menu)).toList();
  }
}

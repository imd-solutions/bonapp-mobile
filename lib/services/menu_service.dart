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
  Future<List<Items>> getFeaturedItems(int id) async {
    GraphQLClient _items = graphQLConfiguration.clientToQuery();
    QueryResult response = await _items.query(
      QueryOptions(
          documentNode: gql(
            menuQuery.getFeaturedItems(),
          ),
          variables: {"id": id}),
    );

    if (response.hasException) {
      throw new Exception('Could not get setting data.');
    }

    final result = response.data;

    Iterable list = result['menuitemFeatured'];

    return list.map((menu) => Items.fromJson(menu)).toList();
  }

  // Get featured Items.
  Future<List<Items>> getPickOfDayItems(int id) async {
    GraphQLClient _items = graphQLConfiguration.clientToQuery();
    QueryResult response = await _items.query(
      QueryOptions(
          documentNode: gql(
            menuQuery.getPickOfDayItems(),
          ),
          variables: {"id": id}),
    );

    if (response.hasException) {
      throw new Exception('Could not get menu data.');
    }

    final result = response.data;

    Iterable list = result['menuitemPickOfDay'];

    return list.map((menu) => Items.fromJson(menu)).toList();
  }

  // Get a single menu item.
  Future<Items> getMenuitemShop(int id, int pid) async {
    GraphQLClient _items = graphQLConfiguration.clientToQuery();
    QueryResult response = await _items.query(
      QueryOptions(
          documentNode: gql(
            menuQuery.getShopItem(),
          ),
          variables: {
            "id": id,
            "pid": pid,
          }),
    );

    if (response.hasException) {
      throw new Exception(response.exception.graphqlErrors);
    }

    final result = response.data;

    return Items(
      name: result['menuitemShop']['name'],
      subtitle: result['menuitemShop']['subtitle'],
      description: result['menuitemShop']['description'],
      image: result['menuitemShop']['image'],
      pivot: ItemPivot(
        mainPrice: result['menuitemShop']['pivot']['main_price'],
        qty: result['menuitemShop']['pivot']['qty'],
      ),
    );
  }

  // Get featured Items.
  Future<List<Items>> getItemsCategory(int id, int cid) async {
    GraphQLClient _items = graphQLConfiguration.clientToQuery();
    QueryResult response = await _items.query(
      QueryOptions(
          documentNode: gql(
            menuQuery.getItemsCategory(),
          ),
          variables: {"id": id, "cid": cid}),
    );

    if (response.hasException) {
      throw new Exception('Could not get setting data.');
    }

    final result = response.data;

    Iterable list = result['menuitemsCategory'];

    return list.map((menu) => Items.fromJson(menu)).toList();
  }
}

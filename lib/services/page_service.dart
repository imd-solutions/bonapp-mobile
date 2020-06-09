import 'package:flutter_bonapp/api/queries/page_query.dart';
import 'package:flutter_bonapp/models/page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/config/graphql.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

PageQuery pageQuery = PageQuery();

class PageService {
  Future<Page> getActivePage(int id) async {
    GraphQLClient _pages = graphQLConfiguration.clientToQuery();
    QueryResult response = await _pages.query(
      QueryOptions(
        documentNode: gql(
          pageQuery.getSinglePage(),
        ),
        variables: {"id": id},
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    return Page(
      title: result['page']['title'],
      body: result['page']['body'],
    );
  }
}

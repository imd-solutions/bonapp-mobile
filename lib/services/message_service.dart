import 'package:flutter_bonapp/api/queries/messages_query.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/config/graphql.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

MessagesQuery messageQuery = MessagesQuery();

class MessagesService {
  Future<List<Messages>> getAllUserMessages(int uid) async {
    GraphQLClient _messages = graphQLConfiguration.clientToQuery();
    QueryResult response = await _messages.query(
      QueryOptions(
        documentNode: gql(
          messageQuery.getAllUserMessages(),
        ),
        variables: {"uid": uid}
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['userMessages'];

    return list.map((message) => Messages.fromJson(message)).toList();
  }
}

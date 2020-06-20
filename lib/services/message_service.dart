import 'package:flutter_bonapp/api/mutations/messages_mutation.dart';
import 'package:flutter_bonapp/api/queries/messages_query.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/config/graphql.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

MessagesQuery messageQuery = MessagesQuery();
MessagesMutation messageMutation = MessagesMutation();

class MessagesService {
  Future<List<Messages>> getAllUserMessages(int uid) async {
    GraphQLClient _messages = graphQLConfiguration.clientToQuery();
    QueryResult response = await _messages.query(
      QueryOptions(
          documentNode: gql(
            messageQuery.getAllUserMessages(),
          ),
          variables: {"uid": uid}),
    );

    if (response.hasException) {
      String message = response.exception.graphqlErrors.first.message;
      // Incorrect user credentials.
      throw new Exception(message);
    }

    final result = response.data;

    Iterable list = result['userMessages'];

    return list.map((message) => Messages.fromJson(message)).toList();
  }

  Future<List<Messages>> getUnreadUserMessages(int uid) async {
    GraphQLClient _messages = graphQLConfiguration.clientToQuery();
    QueryResult response = await _messages.query(
      QueryOptions(
          documentNode: gql(
            messageQuery.getUnreadUserMessages(),
          ),
          variables: {"uid": uid}),
    );

    if (response.hasException) {
      String message = response.exception.graphqlErrors.first.message;

      // Incorrect user credentials.
      throw new Exception(message);
    }

    final result = response.data;

    Iterable list = result['userUnreadMessages'];

    return list.map((message) => Messages.fromJson(message)).toList();
  }

  Future<Message> markMessageAsRead(int id) async {
    try {
      GraphQLClient _messages = graphQLConfiguration.clientToQuery();
      QueryResult response = await _messages.mutate(
        MutationOptions(
          documentNode: gql(
            messageMutation.markMessageAsRead(),
          ),
          variables: {"id": id},
        ),
      );

      if (response.hasException) {
        String message = response.exception.graphqlErrors.first.message;

        // Incorrect user credentials.
        throw new Exception(message);
      }

      final result = response.data['markMessageAsRead'];

      return Message(
        status: 200,
        title: 'Success',
        message: result['message'],
        colour: successColour,
        data: null,
      );
    } catch (e) {
      return Message(
        status: 401,
        title: 'Error',
        message: e.toString(),
        colour: errorColour,
        data: null,
      );
    }
  }

  Future<Message> deleteMessage(int id) async {
    try {
      GraphQLClient _messages = graphQLConfiguration.clientToQuery();
      QueryResult response = await _messages.mutate(
        MutationOptions(
          documentNode: gql(
            messageMutation.deleteMessage(),
          ),
          variables: {"id": id},
        ),
      );

      if (response.hasException) {
        String message = response.exception.graphqlErrors.first.message;

        // Incorrect user credentials.
        throw new Exception(message);
      }

      final result = response.data['delete'];

      return Message(
        status: 200,
        title: 'Success',
        message: result['message'],
        colour: successColour,
        data: null,
      );
    } catch (e) {
      return Message(
        status: 401,
        title: 'Error',
        message: e.toString(),
        colour: errorColour,
        data: null,
      );
    }
  }
}

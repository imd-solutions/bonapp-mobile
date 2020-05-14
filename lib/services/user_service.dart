import 'package:flutter_bonapp/api/mutations/user_mutation.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/title.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './../models/user.dart';
import './../config/graphql.dart';
import './../api/queries/user_query.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

UserQuery userQuery = UserQuery();
UserMutation userMutation = UserMutation();

class UserService {
  // Get the list of titles.
  Future<List<Titles>> getTitles() async {
    GraphQLClient _user = graphQLConfiguration.clientToQuery();
    QueryResult response = await _user.query(
      QueryOptions(
        documentNode: gql(
          userQuery.getTitles(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get title data.');
    }

    final result = response.data;

    Iterable list = result['titles'];

    return list.map((titles) => Titles.fromJson(titles)).toList();
  }

  // Get a list of users from the site.
  Future<User> getUsers() async {
    GraphQLClient _user = graphQLConfiguration.clientToQuery();
    QueryResult response = await _user.query(
      QueryOptions(
        documentNode: gql(
          userQuery.getUsers(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get user data.');
    }

    final result = response.data;

    User user = User(
      name: result['user']['name'],
      email: result['user']['email'],
      password: result['user']['password'],
    );

    return user;
  }

  // Get a specific user from ID.
  Future<User> getUser(int id) async {
    GraphQLClient _user = graphQLConfiguration.clientToQuery();
    QueryResult response = await _user.query(
      QueryOptions(
        documentNode: gql(
          userQuery.getUser(),
        ),
        variables: {"id": id},
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get user data.');
    }

    final result = response.data;

    User user = User(
      name: result['user']['name'],
      email: result['user']['email'],
      password: result['user']['password'],
    );

    return user;
  }

  // Log user into application.
  Future<Message> loginUser(User user) async {
    try {
      GraphQLClient _user = graphQLConfiguration.clientToQuery();
      QueryResult response = await _user.mutate(
        MutationOptions(
          documentNode: gql(
            userMutation.loginUser(),
          ),
          variables: {
            "data": {
              "username": user.email,
              "password": user.password,
            }
          },
        ),
      );

      if (response.hasException) {
        String message = response.exception.graphqlErrors.first.message;

        // Incorrect user credentials.
        if (message == 'The user credentials were incorrect.') {
          throw new Exception(message + ' Please try again');
        } else {
          // Any other message.
          throw new Exception('Something has gone wrong. Please contact the system administrator.');
        }
      }

      final result = response.data;

      if (response.data['login']['user']['email_verified_at'] == null) {
        return Message(
          status: 301,
          title: 'Warning',
          message: 'Please verify your email.',
          colour: warningColour,
          data: null,
        );
      }

      return Message(
        status: 200,
        title: 'Success',
        message: 'Logging you in...',
        colour: successColour,
        data: User(
          name: result['login']['user']['name'],
          email: result['login']['user']['email'],
          profile: Profile(
            firstname: result['login']['user']['profile']['firstname'],
            lastname: result['login']['user']['profile']['lastname'],
          ),
        ),
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

  // Register the user.
  Future<Message> registerUser(User user, Profile profile, String token) async {
    try {
      GraphQLClient _user = graphQLConfiguration.clientToQuery();
      QueryResult response = await _user.mutate(
        MutationOptions(
          documentNode: gql(
            userMutation.createUser(),
          ),
          variables: {
            "data": {
              "firstname": profile.firstname,
              "lastname": profile.lastname,
              "mobile_number": profile.mobileNumber,
              "email": user.email,
              "password": user.password,
              "mobile_token": token,
              "title": profile.title,
            }
          },
        ),
      );

      if (response.hasException && response.exception.graphqlErrors.first.extensions['validation'] != null) {
        var message = response.exception.graphqlErrors.first.extensions['validation']['data.email'].toString();
        return Message(
          status: 301,
          title: 'Warning',
          message: message,
          colour: warningColour,
        );
      }

      if (response.hasException) {
        throw new Exception('Something went wrong.');
      }

      return Message(
        status: 200,
        title: 'Success',
        message: 'You have been registered successfully. Please check your email.',
        colour: successColour,
      );
    } catch (e) {
      return Message(
        status: 401,
        title: 'Error',
        message: e.toString(),
        colour: errorColour,
      );
    }
  }

  // Forgotten user password.
  Future<Message> forgottenPassword(String email) async {
    try {
      GraphQLClient _user = graphQLConfiguration.clientToQuery();
      QueryResult response = await _user.mutate(
        MutationOptions(
          documentNode: gql(
            userMutation.forgottenPassword(),
          ),
          variables: {
            "data": {
              "email": email,
            }
          },
        ),
      );

      if (response.hasException) {
        throw new Exception('There seems to be a problem. Please contact the system admin.');
      }

      final result = response.data;

      if (result['forgotPassword']['status'] == 'EMAIL_NOT_SENT') {
        return Message(
          status: 301,
          title: 'Warning',
          message: result['forgotPassword']['message'],
          colour: warningColour,
        );
      } else {
        return Message(
          status: 200,
          title: 'Success',
          message: result['forgotPassword']['message'],
          colour: successColour,
        );
      }
    } catch (e) {
      return Message(
        status: 401,
        title: 'Error',
        message: e.toString(),
        colour: errorColour,
      );
    }
  }
}

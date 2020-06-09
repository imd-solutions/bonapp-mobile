import 'package:flutter_bonapp/api/mutations/user_mutation.dart';
import 'package:flutter_bonapp/models/location.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/profession.dart';
import 'package:flutter_bonapp/models/title.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/api/queries/user_query.dart';

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

  // Get the list of locations.
  Future<List<Locations>> getLocations() async {
    GraphQLClient _user = graphQLConfiguration.clientToQuery();
    QueryResult response = await _user.query(
      QueryOptions(
        documentNode: gql(
          userQuery.getLocations(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get title data.');
    }

    final result = response.data;

    Iterable list = result['sites'];

    return list.map((sites) => Locations.fromJson(sites)).toList();
  }

  // Get the list of professions.
  Future<List<Professions>> getProfessions() async {
    GraphQLClient _user = graphQLConfiguration.clientToQuery();
    QueryResult response = await _user.query(
      QueryOptions(
        documentNode: gql(
          userQuery.getProfessions(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception('Could not get professions data.');
    }

    final result = response.data;

    Iterable list = result['professions'];

    return list.map((professions) => Professions.fromJson(professions)).toList();
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
      id: int.parse(result['user']['id']),
      name: result['user']['name'],
      avatar: result['user']['avatar'],
      email: result['user']['email'],
      password: result['user']['password'],
      messages: List<Messages>.from(
        result['user']['messages'].map(
          (i) => Messages(
            id: int.parse(i['id']),
            title: i['title'],
            body: i['body'],
          ),
        ),
      ),
      orders: List<Order>.from(
        result['user']['orders'].map(
          (i) => Order(
            id: i['id'],
          ),
        ),
      ),
      profile: Profile(
          firstname: result['user']['profile']['firstname'],
          lastname: result['user']['profile']['lastname'],
          points: result['user']['profile']['points'],
          alerts: Alert(
            email: result['user']['profile']['alerts']['email'] == 1 ? true : false,
            notification: result['user']['profile']['alerts']['notification'] == 1 ? true : false,
            text: result['user']['profile']['alerts']['text'] == 1 ? true : false,
          )),
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
            "input": {
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
          throw new Exception(response.exception.graphqlErrors.toString());
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
          id: int.parse(result['login']['user']['id']),
          name: result['login']['user']['name'],
          avatar: result['login']['user']['avatar'],
          email: result['login']['user']['email'],
          messages: List<Messages>.from(
            result['login']['user']['messages'].map(
              (i) => Messages(
                id: int.parse(i['id']),
                title: i['title'],
                body: i['body'],
              ),
            ),
          ),
          orders: List<Order>.from(
            result['login']['user']['orders'].map(
              (i) => Order(
                id: i['id'],
              ),
            ),
          ),
          profile: Profile(
            firstname: result['login']['user']['profile']['firstname'],
            lastname: result['login']['user']['profile']['lastname'],
            points: result['login']['user']['profile']['points'],
            alerts: Alert(
              email: result['login']['user']['profile']['alerts']['email'] == 1 ? true : false,
              notification: result['login']['user']['profile']['alerts']['notification'] == 1 ? true : false,
              text: result['login']['user']['profile']['alerts']['text'] == 1 ? true : false,
            ),
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
            "input": {
              "title": profile.title,
              "firstname": profile.firstname,
              "lastname": profile.lastname,
              "email": user.email,
              "password": user.password,
              "mobile_number": profile.mobileNumber,
              "site": profile.location,
              "job": profile.profession,
            }
          },
        ),
      );

      if (response.hasException && response.exception.graphqlErrors.first.extensions['validation'] != null) {
        var message = response.exception.graphqlErrors.first.extensions['validation'].toString();
        return Message(
          status: 301,
          title: 'Warning',
          message: message,
          colour: warningColour,
        );
      }

      if (response.hasException) {
        throw new Exception(response.exception.graphqlErrors.toString());
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
            "input": {
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

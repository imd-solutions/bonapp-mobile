import 'package:graphql_flutter/graphql_flutter.dart';
import './../models/settings.dart';
import './../config/graphql.dart';
import './../api/queries/settings_query.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

SettingsQuery settingQuery = SettingsQuery();

class SettingService {
  Future<Setting> getSetting() async {
    GraphQLClient _setting = graphQLConfiguration.clientToQuery();
    QueryResult response = await _setting.query(QueryOptions(documentNode: gql(settingQuery.getApplicationSettings())));

    if (response.hasException) {
      throw new Exception('Could not get setting data.');
    }

    final result = response.data;

    Setting setting = Setting(
        brightness: result['app']['brightness'],
        primary: int.parse(result['app']['primary']),
        accent: int.parse(result['app']['accent']),
        background: int.parse(result['app']['background']),
        introSlider: result['app']['intro_slider'],
        introFull: result['app']['intro_full']);

    return setting;
  }
}

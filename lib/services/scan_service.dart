import 'package:flutter_bonapp/api/mutations/scan_mutation.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

ScanMutation scanMutation = ScanMutation();

class ScanService {
  Future<Message> scanQRCode(int uid, String code) async {
    try {
      GraphQLClient _order = graphQLConfiguration.clientToQuery();
      QueryResult response = await _order.mutate(
        MutationOptions(
          documentNode: gql(
            scanMutation.scanQRCode(),
          ),
          variables: {
            "input": {
              "user": uid,
              "code": code,
            }
          },
        ),
      );

      if (response.hasException) {
        throw new Exception(response.exception.graphqlErrors);
      }

      final result = response.data;

      if (result['scanQRcode']['status'] != 200) {
        return Message(
          title: 'Warning',
          status: result['scanQRcode']['status'],
          message: result['scanQRcode']['message'],
          colour: warningColour,
        );
      }

      return Message(
        title: 'Success',
        status: result['scanQRcode']['status'],
        message: result['scanQRcode']['message'],
        colour: successColour,
      );
    } catch (e) {
      return Message(
        title: 'Error',
        status: 401,
        message: e.toString(),
        colour: warningColour,
      );
    }
  }

  Future<Message> scanQRCodeVoucher(String code) async {
    try {
      GraphQLClient _order = graphQLConfiguration.clientToQuery();
      QueryResult response = await _order.mutate(
        MutationOptions(
          documentNode: gql(
            scanMutation.scanQRCodeVoucher(),
          ),
          variables: {
            "input": {
              "code": code,
            }
          },
        ),
      );

      if (response.hasException) {
        throw new Exception(response.exception.graphqlErrors);
      }

      final result = response.data;

      if (result['scanQRcodeVoucher']['status'] != 200) {
        return Message(
          title: 'Warning',
          status: result['scanQRcodeVoucher']['status'],
          message: result['scanQRcodeVoucher']['message'],
          colour: warningColour,
        );
      }

      return Message(
        title: 'Success',
        status: result['scanQRcodeVoucher']['status'],
        message: result['scanQRcodeVoucher']['message'],
        colour: successColour,
      );
    } catch (e) {
      return Message(
        title: 'Error',
        status: 401,
        message: e.toString(),
        colour: warningColour,
      );
    }
  }
}

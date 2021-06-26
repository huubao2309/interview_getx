import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:interview_getx/config/config_environment.dart';
import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseGraphQLProvider {
  BaseGraphQLProvider._internal();

  static final config = Get.find<EnvConfiguration>();
  static final storage = Get.find<SharedPreferences>();

  static String? _token = '';

  static final HttpLink httpLink = HttpLink(config.value[GraphQLServiceUrl]!);

  static final AuthLink authLink = AuthLink(getToken: () async {
    _token = storage.getString(StorageConstants.token);
    if (_token != null) {
      return 'Bearer $_token';
    }
    return _token;
  });

  static Map<String, dynamic> getHeaderAuthorizationMap() {
    return <String, dynamic>{
      'headers': {AUTHORIZATION_FIELD: 'Bearer $_token'},
    };
  }

  static final WebSocketLink webSocketLink = WebSocketLink(
    config.value[WebSocketGraphQLUrl]!,
    config: const SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initialPayload: getHeaderAuthorizationMap,
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(webSocketLink);

  static final ValueNotifier<GraphQLClient> _graphQL = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  static final instance = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
      defaultPolicies: DefaultPolicies(
        watchQuery: Policies(
          fetch: FetchPolicy.noCache,
        ),
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        mutate: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    ),
  );

  ValueNotifier<GraphQLClient> get graphQL => _graphQL;
}

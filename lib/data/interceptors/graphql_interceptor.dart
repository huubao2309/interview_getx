import 'package:graphql_flutter/graphql_flutter.dart';

Object handleErrorGraphQL(OperationException exception) {
  if (exception.linkException != null) {
    final statusCode = (exception.linkException as HttpLinkParserException).response.statusCode;
    _handleStatusCodeServer(exception, statusCode);
    return statusCode;
  } else {
    return exception.graphqlErrors.first.extensions!['code'];
  }
}

void _handleStatusCodeServer(OperationException exception, int statusCode) {
  switch (statusCode) {
    case 400:
      print('400 Bad Request: $exception');
      break;
    case 401:
      print('401 Expired token: $exception');
      break;
    case 403:
      print('403 Forbidden HTTP: $exception');
      break;
    case 404:
      print('404 Not Found: $exception');
      break;
    case 500:
      print('500 Internal Error: $exception');
      break;
    case 503:
      print('503 Service Unavailable: $exception');
      break;
    default:
      print('StatusCode $statusCode: $exception');
      break;
  }
}

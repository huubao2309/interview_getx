// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'demo_subscription_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DemoSubscriptionGraphql$Subscription$Todos extends JsonSerializable
    with EquatableMixin {
  DemoSubscriptionGraphql$Subscription$Todos();

  factory DemoSubscriptionGraphql$Subscription$Todos.fromJson(
          Map<String, dynamic> json) =>
      _$DemoSubscriptionGraphql$Subscription$TodosFromJson(json);

  late int id;

  late String title;

  @override
  List<Object?> get props => [id, title];
  @override
  Map<String, dynamic> toJson() =>
      _$DemoSubscriptionGraphql$Subscription$TodosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DemoSubscriptionGraphql$Subscription extends JsonSerializable
    with EquatableMixin {
  DemoSubscriptionGraphql$Subscription();

  factory DemoSubscriptionGraphql$Subscription.fromJson(
          Map<String, dynamic> json) =>
      _$DemoSubscriptionGraphql$SubscriptionFromJson(json);

  late List<DemoSubscriptionGraphql$Subscription$Todos> todos;

  @override
  List<Object?> get props => [todos];
  @override
  Map<String, dynamic> toJson() =>
      _$DemoSubscriptionGraphql$SubscriptionToJson(this);
}

final DEMO_SUBSCRIPTION_GRAPHQL_SUBSCRIPTION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: null,
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'todos'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class DemoSubscriptionGraphqlSubscription extends GraphQLQuery<
    DemoSubscriptionGraphql$Subscription, JsonSerializable> {
  DemoSubscriptionGraphqlSubscription();

  @override
  final DocumentNode document = DEMO_SUBSCRIPTION_GRAPHQL_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName = 'demo_subscription_graphql';

  @override
  List<Object?> get props => [document, operationName];
  @override
  DemoSubscriptionGraphql$Subscription parse(Map<String, dynamic> json) =>
      DemoSubscriptionGraphql$Subscription.fromJson(json);
}

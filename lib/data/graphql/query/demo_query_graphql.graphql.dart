// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'demo_query_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetActiveTodos$Query$TodosSelectColumn extends JsonSerializable
    with EquatableMixin {
  GetActiveTodos$Query$TodosSelectColumn();

  factory GetActiveTodos$Query$TodosSelectColumn.fromJson(
          Map<String, dynamic> json) =>
      _$GetActiveTodos$Query$TodosSelectColumnFromJson(json);

  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  late String title;

  int? id;

  @override
  List<Object?> get props => [isCompleted, title, id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetActiveTodos$Query$TodosSelectColumnToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetActiveTodos$Query extends JsonSerializable with EquatableMixin {
  GetActiveTodos$Query();

  factory GetActiveTodos$Query.fromJson(Map<String, dynamic> json) =>
      _$GetActiveTodos$QueryFromJson(json);

  late List<GetActiveTodos$Query$TodosSelectColumn> todos;

  @override
  List<Object?> get props => [todos];
  @override
  Map<String, dynamic> toJson() => _$GetActiveTodos$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetActiveTodosArguments extends JsonSerializable with EquatableMixin {
  GetActiveTodosArguments({this.limit, this.offset});

  @override
  factory GetActiveTodosArguments.fromJson(Map<String, dynamic> json) =>
      _$GetActiveTodosArgumentsFromJson(json);

  final int? limit;

  final int? offset;

  @override
  List<Object?> get props => [limit, offset];
  @override
  Map<String, dynamic> toJson() => _$GetActiveTodosArgumentsToJson(this);
}

final GET_ACTIVE_TODOS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getActiveTodos'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'limit')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'offset')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'todos'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'limit'),
                  value: VariableNode(name: NameNode(value: 'limit'))),
              ArgumentNode(
                  name: NameNode(value: 'offset'),
                  value: VariableNode(name: NameNode(value: 'offset')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'is_completed'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetActiveTodosQuery
    extends GraphQLQuery<GetActiveTodos$Query, GetActiveTodosArguments> {
  GetActiveTodosQuery({required this.variables});

  @override
  final DocumentNode document = GET_ACTIVE_TODOS_QUERY_DOCUMENT;

  @override
  final String operationName = 'getActiveTodos';

  @override
  final GetActiveTodosArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetActiveTodos$Query parse(Map<String, dynamic> json) =>
      GetActiveTodos$Query.fromJson(json);
}

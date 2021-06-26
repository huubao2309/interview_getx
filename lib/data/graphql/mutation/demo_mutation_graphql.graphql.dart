// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'demo_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DemoMutationGraphql$Mutation$Todos$Users extends JsonSerializable
    with EquatableMixin {
  DemoMutationGraphql$Mutation$Todos$Users();

  factory DemoMutationGraphql$Mutation$Todos$Users.fromJson(
          Map<String, dynamic> json) =>
      _$DemoMutationGraphql$Mutation$Todos$UsersFromJson(json);

  late String name;

  late String id;

  @override
  List<Object?> get props => [name, id];
  @override
  Map<String, dynamic> toJson() =>
      _$DemoMutationGraphql$Mutation$Todos$UsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DemoMutationGraphql$Mutation$Todos extends JsonSerializable
    with EquatableMixin {
  DemoMutationGraphql$Mutation$Todos();

  factory DemoMutationGraphql$Mutation$Todos.fromJson(
          Map<String, dynamic> json) =>
      _$DemoMutationGraphql$Mutation$TodosFromJson(json);

  late String title;

  List<DemoMutationGraphql$Mutation$Todos$Users>? user;

  @override
  List<Object?> get props => [title, user];
  @override
  Map<String, dynamic> toJson() =>
      _$DemoMutationGraphql$Mutation$TodosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DemoMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  DemoMutationGraphql$Mutation();

  factory DemoMutationGraphql$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DemoMutationGraphql$MutationFromJson(json);

  @JsonKey(name: 'insert_todos_one')
  late DemoMutationGraphql$Mutation$Todos insertTodosOne;

  @override
  List<Object?> get props => [insertTodosOne];
  @override
  Map<String, dynamic> toJson() => _$DemoMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DemoMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  DemoMutationGraphqlArguments({required this.value});

  @override
  factory DemoMutationGraphqlArguments.fromJson(Map<String, dynamic> json) =>
      _$DemoMutationGraphqlArgumentsFromJson(json);

  late String value;

  @override
  List<Object?> get props => [value];
  @override
  Map<String, dynamic> toJson() => _$DemoMutationGraphqlArgumentsToJson(this);
}

final DEMO_MUTATION_GRAPHQL_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: null,
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'value')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'insert_todos_one'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'object'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'title'),
                        value: VariableNode(name: NameNode(value: 'value')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
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
      ]))
]);

class DemoMutationGraphqlMutation extends GraphQLQuery<
    DemoMutationGraphql$Mutation, DemoMutationGraphqlArguments> {
  DemoMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document = DEMO_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'demo_mutation_graphql';

  @override
  final DemoMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DemoMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      DemoMutationGraphql$Mutation.fromJson(json);
}

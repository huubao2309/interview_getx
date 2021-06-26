// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'demo_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoMutationGraphql$Mutation$Todos$Users
    _$DemoMutationGraphql$Mutation$Todos$UsersFromJson(
        Map<String, dynamic> json) {
  return DemoMutationGraphql$Mutation$Todos$Users()
    ..name = json['name'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$DemoMutationGraphql$Mutation$Todos$UsersToJson(
        DemoMutationGraphql$Mutation$Todos$Users instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

DemoMutationGraphql$Mutation$Todos _$DemoMutationGraphql$Mutation$TodosFromJson(
    Map<String, dynamic> json) {
  return DemoMutationGraphql$Mutation$Todos()
    ..title = json['title'] as String
    ..user = (json['user'] as List<dynamic>?)
        ?.map((e) => DemoMutationGraphql$Mutation$Todos$Users.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DemoMutationGraphql$Mutation$TodosToJson(
        DemoMutationGraphql$Mutation$Todos instance) =>
    <String, dynamic>{
      'title': instance.title,
      'user': instance.user?.map((e) => e.toJson()).toList(),
    };

DemoMutationGraphql$Mutation _$DemoMutationGraphql$MutationFromJson(
    Map<String, dynamic> json) {
  return DemoMutationGraphql$Mutation()
    ..insertTodosOne = DemoMutationGraphql$Mutation$Todos.fromJson(
        json['insert_todos_one'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DemoMutationGraphql$MutationToJson(
        DemoMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'insert_todos_one': instance.insertTodosOne.toJson(),
    };

DemoMutationGraphqlArguments _$DemoMutationGraphqlArgumentsFromJson(
    Map<String, dynamic> json) {
  return DemoMutationGraphqlArguments(
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$DemoMutationGraphqlArgumentsToJson(
        DemoMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

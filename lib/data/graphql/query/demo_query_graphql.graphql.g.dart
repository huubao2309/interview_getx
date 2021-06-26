// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'demo_query_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActiveTodos$Query$TodosSelectColumn
    _$GetActiveTodos$Query$TodosSelectColumnFromJson(
        Map<String, dynamic> json) {
  return GetActiveTodos$Query$TodosSelectColumn()
    ..isCompleted = json['is_completed'] as bool?
    ..title = json['title'] as String
    ..id = json['id'] as int?;
}

Map<String, dynamic> _$GetActiveTodos$Query$TodosSelectColumnToJson(
        GetActiveTodos$Query$TodosSelectColumn instance) =>
    <String, dynamic>{
      'is_completed': instance.isCompleted,
      'title': instance.title,
      'id': instance.id,
    };

GetActiveTodos$Query _$GetActiveTodos$QueryFromJson(Map<String, dynamic> json) {
  return GetActiveTodos$Query()
    ..todos = (json['todos'] as List<dynamic>)
        .map((e) => GetActiveTodos$Query$TodosSelectColumn.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetActiveTodos$QueryToJson(
        GetActiveTodos$Query instance) =>
    <String, dynamic>{
      'todos': instance.todos.map((e) => e.toJson()).toList(),
    };

GetActiveTodosArguments _$GetActiveTodosArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetActiveTodosArguments(
    limit: json['limit'] as int?,
    offset: json['offset'] as int?,
  );
}

Map<String, dynamic> _$GetActiveTodosArgumentsToJson(
        GetActiveTodosArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };

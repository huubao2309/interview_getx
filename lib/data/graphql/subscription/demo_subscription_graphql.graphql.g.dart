// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'demo_subscription_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoSubscriptionGraphql$Subscription$Todos
    _$DemoSubscriptionGraphql$Subscription$TodosFromJson(
        Map<String, dynamic> json) {
  return DemoSubscriptionGraphql$Subscription$Todos()
    ..id = json['id'] as int
    ..title = json['title'] as String;
}

Map<String, dynamic> _$DemoSubscriptionGraphql$Subscription$TodosToJson(
        DemoSubscriptionGraphql$Subscription$Todos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

DemoSubscriptionGraphql$Subscription
    _$DemoSubscriptionGraphql$SubscriptionFromJson(Map<String, dynamic> json) {
  return DemoSubscriptionGraphql$Subscription()
    ..todos = (json['todos'] as List<dynamic>)
        .map((e) => DemoSubscriptionGraphql$Subscription$Todos.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DemoSubscriptionGraphql$SubscriptionToJson(
        DemoSubscriptionGraphql$Subscription instance) =>
    <String, dynamic>{
      'todos': instance.todos.map((e) => e.toJson()).toList(),
    };

import 'package:interview_getx/models/user_model/user_model.dart';

class TodoModel {
  TodoModel({
    this.isCompleted,
    this.title,
    this.id,
    this.createdAt,
    this.user,
  });

  final bool? isCompleted;

  final String? title;

  final int? id;

  final DateTime? createdAt;

  final UserModel? user;
}

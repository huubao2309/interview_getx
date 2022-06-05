import 'package:interview_getx/data/common/define_field.dart';

class GetListTodoRequest {
  GetListTodoRequest({
    required this.offset,
    required this.limit,
  });

  final int offset;
  final int limit;

  Map<String, dynamic> toJson() => {
        OFFSET_FIELD: offset,
        LIMIT_FIELD: limit,
      };
}

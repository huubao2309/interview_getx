import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_service.dart';
import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source.dart';

class ObjectBoxSourceImpl implements ObjectBoxSource {
  ObjectBoxSourceImpl({required this.objectBox});

  final ObjectBox objectBox;

  @override
  void log() {
    // TODO: implement log
  }

  @override
  void writeLog() {
    // TODO: implement writeLog
  }
}

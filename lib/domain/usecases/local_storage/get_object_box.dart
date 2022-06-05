import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source.dart';
import 'package:interview_getx/data/repository/local_repository/local_repository.dart';

class GetObjectBox {
  GetObjectBox(this.repository);

  final LocalRepository repository;

  ObjectBoxSource get value => repository.getLocalObjectBox();
}

import 'package:interview_getx/data/data_sources/local_data/local_data_source.dart';
import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source.dart';
import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source.dart';
import 'package:interview_getx/data/repository/local_repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  LocalRepositoryImpl({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;

  @override
  ObjectBoxSource getLocalObjectBox() {
    return localDataSource.getLocalObjectBox();
  }

  @override
  SharedPreferencesSource getLocalSPref() {
    return localDataSource.getLocalSPref();
  }
}

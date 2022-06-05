import 'package:interview_getx/data/data_sources/local_data/local_data_source.dart';
import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source.dart';
import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl({
    required this.localSharedPreferences,
    required this.localObjectBoxSource,
  });

  final SharedPreferencesSource localSharedPreferences;
  final ObjectBoxSource localObjectBoxSource;

  @override
  ObjectBoxSource getLocalObjectBox() {
    return localObjectBoxSource;
  }

  @override
  SharedPreferencesSource getLocalSPref() {
    return localSharedPreferences;
  }
}

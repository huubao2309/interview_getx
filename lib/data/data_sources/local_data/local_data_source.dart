import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source.dart';
import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source.dart';

abstract class LocalDataSource {
  SharedPreferencesSource getLocalSPref();
  ObjectBoxSource getLocalObjectBox();
}

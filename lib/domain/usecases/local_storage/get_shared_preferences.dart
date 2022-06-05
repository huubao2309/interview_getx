import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source.dart';
import 'package:interview_getx/data/repository/local_repository/local_repository.dart';

class GetSharedPreferences {
  GetSharedPreferences(this.repository);

  final LocalRepository repository;

  SharedPreferencesSource get value => repository.getLocalSPref();
}

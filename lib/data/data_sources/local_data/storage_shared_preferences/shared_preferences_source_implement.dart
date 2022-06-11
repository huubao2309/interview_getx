import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSourceImpl implements SharedPreferencesSource {
  SharedPreferencesSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  String getLocalId() {
    final result = sharedPreferences.getString(StorageConstants.userId) ?? '';
    return result;
  }

  @override
  Future<void> setLocalId({required String? id}) async {
    await sharedPreferences.setString(StorageConstants.userId, id ?? '');
  }

  @override
  String getLocalToken() {
    final result = sharedPreferences.getString(StorageConstants.token) ?? '';
    return result;
  }

  @override
  Future<void> setLocalToken({required String? token}) async {
    await sharedPreferences.setString(StorageConstants.token, token ?? '');
  }

  @override
  String getLocalThemeApp() {
    final result = sharedPreferences.getString(StorageConstants.theme) ?? LIGHT_THEME;
    return result;
  }

  @override
  Future<void> setLocalThemeApp({required String? theme}) async {
    await sharedPreferences.setString(StorageConstants.theme, theme ?? LIGHT_THEME);
  }

  @override
  String getLocalLanguageApp() {
    final result = sharedPreferences.getString(StorageConstants.language) ?? VIETNAMESE_LANG;
    return result;
  }

  @override
  Future<void> setLocalLanguageApp({required String? language}) async {
    await sharedPreferences.setString(StorageConstants.language, language ?? VIETNAMESE_LANG);
  }

  @override
  Future<bool> clearLocalStorage() async {
    await setLocalId(id: null);
    await setLocalToken(token: null);
    return true;
  }
}

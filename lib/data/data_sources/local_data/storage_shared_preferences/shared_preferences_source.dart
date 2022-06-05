// ignore: one_member_abstracts
abstract class SharedPreferencesSource {
  String getLocalId();

  Future<void> setLocalId({required String? id});

  String getLocalToken();

  Future<void> setLocalToken({required String? token});

  String getLocalThemeApp();

  Future<void> setLocalThemeApp({required String? theme});

  String getLocalLanguageApp();

  Future<void> setLocalLanguageApp({required String? language});

  Future<bool> clearLocalStorage();
}

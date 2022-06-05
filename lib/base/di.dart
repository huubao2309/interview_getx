import 'package:get/get.dart';
import 'package:interview_getx/data/data_sources/local_data/local_data_source.dart';
import 'package:interview_getx/data/data_sources/local_data/local_data_source_implement.dart';
import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_service.dart';
import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source.dart';
import 'package:interview_getx/data/data_sources/local_data/object_box/object_box_source_implement.dart';
import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source.dart';
import 'package:interview_getx/data/data_sources/local_data/storage_shared_preferences/shared_preferences_source_implement.dart';
import 'package:interview_getx/data/repository/local_repository/local_repository.dart';
import 'package:interview_getx/data/repository/local_repository/local_repository_implement.dart';
import 'package:interview_getx/domain/usecases/local_storage/get_object_box.dart';
import 'package:interview_getx/domain/usecases/local_storage/get_shared_preferences.dart';
import 'package:interview_getx/shared/dialog_manager/dialog_handler.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/services/config_service.dart';
import 'package:interview_getx/shared/services/locator_service.dart';
import 'package:interview_getx/shared/services/storage_service.dart';

class DependencyInjection {
  Future<void> init(String environment) async {
    await Get.putAsync(() => ConfigService().init(environment));
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => LocateService().init());
    await Get.putAsync(() => ObjectBox.instance.createStore());
    Get.put<DialogService>(DialogService());
    Get.put<DialogHandler>(DialogHandler(dialogService: Get.find()));

    // Local Storage Use case
    // Get Local
    Get
      ..put<ObjectBoxSource>(ObjectBoxSourceImpl(objectBox: Get.find()))
      ..put<SharedPreferencesSource>(SharedPreferencesSourceImpl(sharedPreferences: Get.find()))
      ..put<LocalDataSource>(
        LocalDataSourceImpl(localSharedPreferences: Get.find(), localObjectBoxSource: Get.find()),
        permanent: true,
      )
      ..put<LocalRepository>(LocalRepositoryImpl(localDataSource: Get.find()), permanent: true)
      ..put(GetObjectBox(Get.find()))
      ..put(GetSharedPreferences(Get.find()));
  }
}

import 'package:flash_trainer_app_bloc/app/data/providers/storage_provider.dart';
import 'package:flash_trainer_app_bloc/app/data/repository/database_repository.dart';
import 'package:get/get.dart';

import '../controllers/histroy_controller.dart';

class HistroyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(
          repository: DatabaseRepository(storage: StorageProvider())),
    );
  }
}

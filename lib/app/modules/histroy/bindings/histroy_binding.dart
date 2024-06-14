import 'package:get/get.dart';

import '../../../data/providers/storage_provider.dart';
import '../../../data/repository/database_repository.dart';
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

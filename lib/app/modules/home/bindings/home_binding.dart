import 'package:get/get.dart';

import '../../../data/providers/storage_provider.dart';
import '../../../data/repository/database_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
          repository: DatabaseRepository(storage: StorageProvider())),
    );
  }
}

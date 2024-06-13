import 'package:flash_trainer_app_bloc/app/data/providers/storage_provider.dart';
import 'package:flash_trainer_app_bloc/app/data/repository/database_repository.dart';
import 'package:get/get.dart';

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

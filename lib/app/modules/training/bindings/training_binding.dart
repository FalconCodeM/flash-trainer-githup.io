import 'package:flash_trainer_app_bloc/app/data/providers/storage_provider.dart';
import 'package:flash_trainer_app_bloc/app/data/repository/database_repository.dart';
import 'package:get/get.dart';

import '../controllers/training_controller.dart';

class TrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainingController>(
      () => TrainingController(
          repository: DatabaseRepository(storage: StorageProvider())),
    );
  }
}

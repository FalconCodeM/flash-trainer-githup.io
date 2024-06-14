import 'package:get/get.dart';

import '../../../data/providers/storage_provider.dart';
import '../../../data/repository/database_repository.dart';
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

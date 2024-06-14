import 'package:get/get.dart';

import '../../../data/errors/errors.dart';
import '../../../data/models/users.dart';
import '../../../data/repository/database_repository.dart';
import '../../../routes/app_pages.dart';
import '../views/screens/history_user.dart';

class HistoryController extends GetxController {
  DatabaseRepository repository;

  HistoryController({required this.repository});

  final users = <Users>[].obs;

  @override
  void onInit() {
    users.assignAll(repository.readUsers());
    ever(users, (_) => repository.writeUsers(users));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  routeToUserHistory(Users user) {
    Get.to(HistoryUser(users: user));
  }

  void removeUser(Users deletedUser) {
    users.remove(deletedUser);
    users.refresh();
    AppErrorMsg.toastSuccess(
      msg: "User deleted successfully",
    );
    if (users.isEmpty) {
      Get.offNamed(Routes.HOME);
    }
  }

  void removeTraining(TrainingModel deletedTraining, String userName) {
    var getUser = users.indexWhere((e) => e.userName == userName);
    users[getUser].training.remove(deletedTraining);
    users.refresh();

    if (users[getUser].training.isEmpty) {
      Get.offNamed(Routes.HISTROY);
    }
  }
}

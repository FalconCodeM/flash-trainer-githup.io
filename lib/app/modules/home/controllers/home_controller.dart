import 'package:flash_trainer_app_bloc/app/data/values/strings.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

import '../../../data/errors/errors.dart';
import '../../../data/models/users.dart';
import '../../../data/repository/database_repository.dart';
import '../../../data/services/bluetooth_services.dart';
import '../../histroy/views/screens/history_user.dart';

class HomeController extends GetxController {
  final FlashTrainerBluetoothServices bluetoothServices = Get.find();
  DatabaseRepository repository;

  HomeController({required this.repository});

  final users = <Users>[].obs;

  final deviceName = ''.obs;

  @override
  void onInit() {
    users.assignAll(repository.readUsers());
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

  RxString getDeviceName(BluetoothDevice device) {
    if (device != null) {
      if (device.advName.isNotEmpty) {
        deviceName.value = device.advName;
      } else if (device.name.isNotEmpty) {
        deviceName.value = device.name;
      } else if (device.localName.isNotEmpty) {
        deviceName.value = device.localName;
      } else if (device.platformName.isNotEmpty) {
        deviceName.value = device.platformName;
      } else {
        deviceName.value = 'Unknown Device';
      }
    } else {
      deviceName.value = AppStrings.noDevice;
    }
    return deviceName;
  }

  searching(String userName) {
    if (userName.trim().isEmpty) {
      AppErrorMsg.toastError(msg: "you have to enter name to make searching");
      return;
    }
    var existingUserIndex = users.indexWhere(
        (user) => user.userName.toLowerCase() == userName.trim().toLowerCase());
    if (existingUserIndex != -1) {
      Get.to(HistoryUser(users: users[existingUserIndex]));
    }
  }
}

import 'package:flash_trainer_app_bloc/app/data/services/bluetooth_services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FlashTrainerBluetoothServices bluetoothServices = Get.find();

  final deviceName = ''.obs;


  @override
  void onInit() {
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
    return deviceName;
  }


}

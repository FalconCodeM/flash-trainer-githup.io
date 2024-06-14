import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../errors/errors.dart';
import '../values/keys.dart';

class FlashTrainerBluetoothServices extends GetxService {
  var isScanning = false.obs;
  var connectedDevices = <BluetoothDevice>[].obs;
  var connectedDevice = Rxn<BluetoothDevice>();
  var availableDevices = <ScanResult>[].obs;

  var podsActiveNumbers = <int>[].obs;
  var wrongTouchNumbers = <int>[].obs;
  var rightTouchNumbers = <int>[].obs;
  var averageTimeNumbers = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    FlutterBluePlus.adapterState.listen((state) {
      if (state == BluetoothAdapterState.off) {
        AppErrorMsg.toastError(msg: "Bluetooth is off. Please turn it on.");
      }
    });
  }

  Stream<List<ScanResult>> get scanResultsStream => FlutterBluePlus.scanResults;

  void startScan() {
    if (!isScanning.value) {
      isScanning.value = true;
      availableDevices.clear();
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    }
  }

  void stopScan() {
    FlutterBluePlus.stopScan();
    isScanning.value = false;
  }

  Future<void> listenToCharacteristics() async {
    if (connectedDevice.value == null) return;

    try {
      List<BluetoothService> services =
          await getDeviceServices(connectedDevice.value!);
      for (var service in services) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == AppKeys.podsActiveRole) {
            await _listenToCharacteristic(characteristic, podsActiveNumbers);
          } else if (characteristic.uuid.toString() == AppKeys.rightTouchRole) {
            await _listenToCharacteristic(characteristic, rightTouchNumbers);
          } else if (characteristic.uuid.toString() == AppKeys.wrongTouchRole) {
            await _listenToCharacteristic(characteristic, wrongTouchNumbers);
          } else if (characteristic.uuid.toString() ==
              AppKeys.averageTimeRole) {
            await _listenToCharacteristic(characteristic, averageTimeNumbers);
          }
        }
      }
    } catch (e) {
      AppErrorMsg.toastError(msg: 'Error listening to characteristics: $e');
    }
  }

  Future<void> _listenToCharacteristic(
      BluetoothCharacteristic characteristic, RxList<int> targetList) async {
    try {
      if (characteristic.properties.read || characteristic.properties.notify) {
        characteristic.lastValueStream.listen((value) {
          if (value.isNotEmpty) {
            final message = utf8.decode(value);
            targetList
                .assignAll(transformMessage(message).map(int.parse).toList());
          }
        }, onError: (error) {
          AppErrorMsg.toastError(
              msg: 'Error listening to characteristic value: $error');
        });

        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
        }
        await characteristic.read();
      }
    } catch (e) {
      AppErrorMsg.toastError(msg: 'Error in _listenToCharacteristic: $e');
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
    connectedDevices.add(device);
    connectedDevice.value = device;
    AppErrorMsg.toastSuccess(msg: "Connected to ${device.advName}");
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await device.disconnect();
    connectedDevices.remove(device);
    if (connectedDevice.value == device) {
      connectedDevice.value = null;
    }
    AppErrorMsg.toastInfo(msg: "Disconnected from ${device.advName}");
  }

  Future<List<BluetoothService>> getDeviceServices(
      BluetoothDevice device) async {
    return await device.discoverServices();
  }

  void sendMessage(String message, String characteristicUuid) async {
    final List<BluetoothService> services =
        await connectedDevice.value!.discoverServices();
    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.uuid.toString() == characteristicUuid &&
            characteristic.properties.write) {
          if (_isNumeric(message)) {
            final List<int> dataToSend = utf8.encode(message);
            await characteristic.write(dataToSend);
          } else {
            AppErrorMsg.toastError(msg: "error send message");
            return;
          }
        }
      }
    }
  }

  bool _isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  List<String> transformMessage(String message) {
    final RegExp regex = RegExp(r'\d+');
    final Iterable<Match> matches = regex.allMatches(message);
    return matches.map((match) => match.group(0)!).toList();
  }
}

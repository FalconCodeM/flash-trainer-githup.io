import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/errors/errors.dart';
import '../../../data/models/users.dart';
import '../../../data/repository/database_repository.dart';
import '../../../data/services/bluetooth_services.dart';
import '../../../data/values/colors.dart';
import '../../../data/values/keys.dart';
import '../../../routes/app_pages.dart';
import '../views/screens/finishing_training.dart';
import '../views/screens/start_training.dart';

class TrainingController extends GetxController {
  final FlashTrainerBluetoothServices bluetoothServices =
  Get.find<FlashTrainerBluetoothServices>();
  DatabaseRepository repository;

  TrainingController({required this.repository});

  final users = <Users>[].obs;
  final podsFirstTime = <int>[].obs;
  final podsSecondTime = <int>[].obs;
  final allPodsSelected = <int>[].obs;
  final name = "".obs;
  final time = "".obs;
  final trainingTime = 0.obs;
  final trainingMsg = "".obs;

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

  void selectPod(int i) {
    if (podsFirstTime.contains(i)) {
      podsFirstTime.remove(i);
      podsSecondTime.add(i);
      allPodsSelected.add(i);
    } else if (podsSecondTime.contains(i)) {
      podsSecondTime.remove(i);
      allPodsSelected.remove(i);
    } else {
      podsFirstTime.add(i);
      allPodsSelected.add(i);
    }
  }

  Color podIsActive(int i) {
    if (podsFirstTime.contains(i)) {
      return AppColors.primaryElement;
    } else if (podsSecondTime.contains(i)) {
      return AppColors.primaryElementStatus;
    } else {
      return AppColors.primaryElementBg;
    }
  }

  void checkName(String value) {
    if (value.trim().isEmpty) {
      AppErrorMsg.toastError(msg: "You have to enter user name.");
      return;
    } else {
      name.value = value.trim();
    }
  }

  checkTime(String value) {
    if (value.trim().isEmpty) {
      AppErrorMsg.toastError(msg: "You have to enter training time.");
      return;
    } else {
      time.value = value.trim();
    }
  }

  startTraining() {
    if (name.value.trim().isEmpty ||
        time.value.trim().isEmpty ||
        allPodsSelected.isEmpty) {
      AppErrorMsg.toastError(msg: "please set all training setting");
      return;
    }
    Get.to(const StartTraining());
    _startTraining();
  }

  void _startTraining() async {
    trainingTime.value = int.parse(time.value);
    var activePodsToMessage = allPodsSelected.map((e) => e.toString()).toList();
    bluetoothServices.sendMessage(
        activePodsToMessage.join(','), AppKeys.activePods);
    await Future.delayed(const Duration(milliseconds: 500));
    bluetoothServices.sendMessage(time.value, AppKeys.trainingTime);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      trainingMsg.value = "Ready";
      timer.cancel();
    });

    Timer.periodic(const Duration(seconds: 2), (timer) {
      trainingMsg.value = "Steady";
      timer.cancel();
    });

    Timer.periodic(const Duration(seconds: 3), (timer) {
      trainingMsg.value = "Go";
      timer.cancel();
    });

    Timer.periodic(const Duration(seconds: 4), (timer) {
      _startTimer();
      timer.cancel();
    });
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      trainingTime.value--;
      if (trainingTime.value == 0) {
        finishingTraining();
        timer.cancel();
      }
    });
  }

  void finishingTraining() async {
    await bluetoothServices.listenToCharacteristics();
    await Future.delayed(const Duration(milliseconds: 500));
    Get.to(const FinishingTraining());
  }

  void saveTrainingData() {
    var newTraining = TrainingModel(
      trainingTime: DateFormat("hh:mm a").format(DateTime.now()),
      trainingDay: DateFormat("dd/MM/yyyy").format(DateTime.now()),
      podsUsedCount: bluetoothServices.podsActiveNumbers.isNotEmpty
          ? bluetoothServices.podsActiveNumbers.length
          : 1,
      pods: List.generate(
        bluetoothServices.podsActiveNumbers.isNotEmpty
            ? bluetoothServices.podsActiveNumbers.length
            : 1,
            (index) => Pods(
          wrongTouch: bluetoothServices.wrongTouchNumbers.isNotEmpty
              ? bluetoothServices.wrongTouchNumbers[index].toString()
              : '0',
          rightTouch: bluetoothServices.rightTouchNumbers.isNotEmpty
              ? bluetoothServices.rightTouchNumbers[index].toString()
              : '0',
          averageTime: bluetoothServices.averageTimeNumbers.isNotEmpty
              ? bluetoothServices.averageTimeNumbers[index].toString()
              : '0',
          podName: 'Pod ${index + 1}',
          activePods: bluetoothServices.podsActiveNumbers.isNotEmpty
              ? bluetoothServices.podsActiveNumbers[index].toString()
              : '0',
        ),
      ),
    );

    var existingUserIndex =
    users.indexWhere((user) => user.userName == name.value);

    if (existingUserIndex != -1) {
      users[existingUserIndex].training.add(newTraining);
      users.refresh();
      AppErrorMsg.toastSuccess(
        msg: "User updated successfully",
      );
    } else {
      // User does not exist, create a new user
      var newUser = Users(userName: name.value, training: [newTraining]);
      users.add(newUser);
      users.refresh();
      AppErrorMsg.toastSuccess(
        msg: "User created successfully",
      );
    }

    _resetAllVars();
    update();
    Get.offAllNamed(Routes.HOME);
  }

  void _resetAllVars() {
    name.value = '';
    allPodsSelected.clear();
    time.value = '';
    trainingTime.value = 0;
    bluetoothServices.podsActiveNumbers.clear();
    bluetoothServices.wrongTouchNumbers.clear();
    bluetoothServices.rightTouchNumbers.clear();
    bluetoothServices.averageTimeNumbers.clear();
  }
}

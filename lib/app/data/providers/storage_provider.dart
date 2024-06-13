import 'dart:convert';

import 'package:flash_trainer_app_bloc/app/data/models/users.dart';
import 'package:flash_trainer_app_bloc/app/data/services/storage_services.dart';
import 'package:get/get.dart';

class StorageProvider {
  final StorageServices _storage = Get.find<StorageServices>();
  final key = "users_data";

  List<Users> readUsers() {
    var users = <Users>[];
    jsonDecode(_storage.read(key).toString())
        .forEach((e) => users.add(Users.fromJson(e)));
    return users;
  }

  void writeUsers(List<Users> users) {
    _storage.write(key, jsonEncode(users));
  }
}

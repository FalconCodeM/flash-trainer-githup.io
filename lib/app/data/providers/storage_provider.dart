import 'dart:convert';
import 'package:get/get.dart';

import '../models/users.dart';
import '../services/storage_services.dart';

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

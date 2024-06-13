import 'package:flash_trainer_app_bloc/app/data/models/users.dart';
import 'package:flash_trainer_app_bloc/app/data/providers/storage_provider.dart';

class DatabaseRepository {
  final StorageProvider storage;

  DatabaseRepository({required this.storage});

  List<Users> readUsers() => storage.readUsers();

  void writeUsers(List<Users> users) => storage.writeUsers(users);
}

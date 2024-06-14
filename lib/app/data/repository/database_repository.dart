
import '../models/users.dart';
import '../providers/storage_provider.dart';

class DatabaseRepository {
  final StorageProvider storage;

  DatabaseRepository({required this.storage});

  List<Users> readUsers() => storage.readUsers();

  void writeUsers(List<Users> users) => storage.writeUsers(users);
}

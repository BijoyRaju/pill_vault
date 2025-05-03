import 'package:hive/hive.dart';
part 'user_database.g.dart';

@HiveType(typeId: 1)
class UserDatabase extends HiveObject {

  @HiveField(0)
  String fullName;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String password;

  UserDatabase({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password
});
}
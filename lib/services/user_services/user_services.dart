import 'package:pill_vault/data/user_database.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<UserDatabase?> getLoggedInUser() async{
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.getInt('loggedInUserKey');
    if(key != null){
      final box = Hive.box<UserDatabase>('users');
      return box.get(key);
    }
    return null;
  }
  static Future<void> updateUser({
    required UserDatabase user,
    required String name,
    required String email,
    required String phone,
  })async{
    user.fullName = name;
    user.email = email;
    user.phoneNumber = phone;

    final box = Hive.box<UserDatabase>('users');
    await box.putAt(user.key as int, user);
  }

}

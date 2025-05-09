import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/data/user_database.dart';
import 'package:pill_vault/views/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Intialize Users database
  Hive.registerAdapter(UserDatabaseAdapter());
  await Hive.openBox<UserDatabase>('users');
  // Intialize Medicine database
  Hive.registerAdapter(DatabaseAdapter());
  await Hive.openBox<Database>('mybox');
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.containsKey('loggedInUserKey');

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({
    required this.isLoggedIn,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pill Vault",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(isLoggedIn: isLoggedIn));
  }
}

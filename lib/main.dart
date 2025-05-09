import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/data/user_database.dart';
import 'package:pill_vault/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Intialize Users database
  Hive.registerAdapter(UserDatabaseAdapter());
  await Hive.openBox<UserDatabase>('users');
  // Intialize Medicine database
  Hive.registerAdapter(DatabaseAdapter());
  await Hive.openBox<Database>('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

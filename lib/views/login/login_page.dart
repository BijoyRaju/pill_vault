import 'package:flutter/material.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/user_database.dart';
import 'package:pill_vault/views/bottom_navigations/bottom_navigations.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/widgets/login_buttton.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/views/registor/registor_page.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageConstants.loginPageIcon,
                  height: screenHeight * 0.25,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Sign In Login",
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                TextFieldCustom(controller: emailController, hintText: "Email"),
                const SizedBox(height: 12),
                TextFieldCustom(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Button(
                  title: "Log In",
                  onPressed: () async {
                    final box = Hive.box<UserDatabase>('users');
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    final userKey = box.keys.cast<int?>().firstWhere(
                      (key) {
                        final u = box.get(key);
                        return u?.email == email && u?.password == password;
                      },
                      orElse: () => null,
                    );

                    if (userKey != null) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setInt('loggedInUserKey', userKey);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigations(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(TextConstants.invalidCredential),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Divider(),
                const Text("Or Login With"),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginButtton(
                      onPressed: () {},
                      title: "Google",
                      imagePath: ImageConstants.google,
                    ),
                    const SizedBox(width: 20),
                    LoginButtton(
                      onPressed: () {},
                      title: "Apple",
                      imagePath: ImageConstants.apple,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No Account?", style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegistorPage()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16, color: Color(0xFF07E5B0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

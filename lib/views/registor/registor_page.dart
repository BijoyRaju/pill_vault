import 'package:flutter/material.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/user_database.dart';
import 'package:pill_vault/views/login/login_page.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:hive/hive.dart';


class RegistorPage extends StatefulWidget {
  const RegistorPage({super.key});

  @override
  State<RegistorPage> createState() => _RegistorPageState();
}

class _RegistorPageState extends State<RegistorPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          // Registration Page Image 
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(ImageConstants.registrationPageImg),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Registration",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),

            // Registration Fields (Full Name, Email, Phone Number, Password)
            child: Column(
              children: [
                TextFieldCustom(
                  controller: _fullNameController,
                  hintText: "Full Name"
                  ),
                const SizedBox(height: 10),
                TextFieldCustom(
                  controller: _emailController,
                  hintText: "Email"
                  ),
                const SizedBox(height: 10),
                TextFieldCustom(
                  controller: _phoneController,
                  hintText: "Phone Number"),
                const SizedBox(height: 10),
                TextFieldCustom(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: true,
                  ),
                const SizedBox(height: 10),

                // Register Button 
                Button(title: "Register", onPressed: () async{
                  final name = _fullNameController.text.trim();
                  final email = _emailController.text.trim();
                  final phone = _phoneController.text.trim();
                  final password = _passwordController.text.trim();

                  if(name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(TextConstants.scafolfMsg)));
                    return;
                  }

                  final box = Hive.box<UserDatabase>('users');
                  final exists = box.values.any((u)=>u.email == email);
                  
                  if (exists){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(TextConstants.emailExistMsg)));
                    return;
                  }

                  final user = UserDatabase(
                    fullName: name,
                    email: email,
                    phoneNumber: phone,
                    password: password
                    );

                  await box.add(user);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

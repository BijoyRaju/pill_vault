import 'package:flutter/material.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/user_database.dart';
import 'package:pill_vault/views/bottom_navigations.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/widgets/login_buttton.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/views/registor/registor_page.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32), // Add some padding
          child: Column(
            mainAxisSize: MainAxisSize.min, // Only occupy necessary vertical space
            children: [
              Image.asset(ImageConstants.loginPageIcon),
              const SizedBox(height: 30), // Space between image and text
              const Text(
                "Sign In Login",
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10), 
              TextFieldCustom(
                controller: emailController,
                hintText: "Email"
                ),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,),
              const SizedBox(height: 10),
              Button(title: "Log In", onPressed: ()async{
                    final box = Hive.box<UserDatabase>('users');
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    final user = box.values.cast<UserDatabase?>().firstWhere(
                      (u) => u?.email == email && u?.password == password,
                        orElse: () => null,
                      );

                    if (user != null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigations()));
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(TextConstants.invalidCredential)));
                    }
              }),
              const SizedBox(height: 10),
              Text("Or Login With"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButtton(onPressed: (){}, title: "Google", imagePath: ImageConstants.google),
                  const SizedBox(width: 20,),

                  LoginButtton(onPressed: (){

                  }, title: "Apple", imagePath: ImageConstants.apple
                  ),
                ],
              ),

              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Account?",style: TextStyle(fontSize: 16),),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistorPage()));
                    },
                    child: Text("Sign Up",style: TextStyle(fontSize: 16,color: Color(0xFF07E5B0)))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

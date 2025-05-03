import 'package:flutter/material.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/views/login/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/image/welcome.png',),
            fit: BoxFit.cover
            )
        ),child: Stack(
          children: [
            Positioned(
              top: 600, 
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Smart Storage For \n Smarter Health",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 20),
                  Button(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    icon: Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
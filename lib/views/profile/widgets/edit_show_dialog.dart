import 'package:flutter/material.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/widgets/text_field.dart';

class EditShowDialog extends StatelessWidget {
  final nameController;
  final emailController;
  final phoneController;
  VoidCallback onUpdate;
  VoidCallback onCancel;

   EditShowDialog({
    super.key,
    required this.onUpdate,
    required this.onCancel,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 300,
        width: 350,
        child: Center(
          child: Column(
            children: [
              Text("Edit Profile",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              TextFieldCustom(hintText: "Full Name",controller: nameController,),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: "Email",controller: emailController,),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: "Phone Number",controller: phoneController,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(title: "Cancel", onPressed: onCancel),
                  SizedBox(width: 10,),
                  Button(title: "Update", onPressed:  onUpdate)
                ],
              )
            ],
          ),
        ),

      )
    );
  }
}
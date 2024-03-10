import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sticher/auth/auth_service.dart';
import 'package:sticher/components/buttons.dart';


import '../components/my_textfields.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap
  });

  void register(BuildContext context){
    final _auth = AuthService();

    Future<bool> isEmailRegistered = _auth.isEmailAlreadyRegistered(_emailController.text);

    //if passwords match
    if(_pwController.text == _confirmpwController.text){
      try{
        _auth.signUpWithEmailPassword(
            _emailController.text,
            _pwController.text,
            _nameController.text,
            _phoneController.text,
            _locationController.text
        );
      }
      catch (e){
        showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    //if passwords dont match
    else{
      showDialog(
        context: context,
        builder: (context)=>const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            Text(
              "Lets Create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            MyTextField(
              obsecureText: false,
              controller: _nameController,
              hintText: "Name",
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 10),

            MyTextField(
              obsecureText: false,
              controller: _phoneController,
              hintText: "Phone Number",
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 10),

            MyTextField(
              obsecureText: false,
              controller: _locationController,
              hintText: "Location",
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 10),

            MyTextField(
              obsecureText: false,
              controller: _emailController,
              hintText: "Email",
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 10),

            MyTextField(
              obsecureText: true,
              controller: _pwController,
              hintText: "Password",
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 10),

            MyTextField(
              obsecureText: true,
              controller: _confirmpwController,
              hintText: "Confirm Password",
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 25),

            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have a Account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

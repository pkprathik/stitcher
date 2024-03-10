
import 'package:flutter/material.dart';
import 'package:sticher/auth/auth_service.dart';
import 'package:sticher/components/my_textfields.dart';

import '../components/buttons.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  void login(BuildContext context) async{
    //auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(
          _emailController.text,
          _pwController.text
      );
    }
    //catch errors
    catch(e){
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text(e.toString()),
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
              "Welcome Back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

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

            const SizedBox(height: 25),

            MyButton(
              text: "login",
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
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

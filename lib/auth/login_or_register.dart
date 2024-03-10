
import 'package:flutter/material.dart';
import 'package:sticher/Pages/login_page.dart';
import 'package:sticher/Pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  void toggelPages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(
        onTap: toggelPages,
      );
    } else {
      return RegisterPage(
        onTap: toggelPages,
      );
    }
  }
}

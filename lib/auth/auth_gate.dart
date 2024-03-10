
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sticher/Pages/menu_page.dart';
import 'package:sticher/auth/login_or_register.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          //user is logged in
          if(snapshot.hasData){
            return MenuPage();
          }
          //user is not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}

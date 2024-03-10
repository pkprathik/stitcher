import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/auth/auth_gate.dart';
import 'package:sticher/components/buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 25),

          Text(
            "Sticher",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset('lib/images/sewing.png'),
          ),

          const SizedBox(height: 25,),

          Text(
            "Something",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 44,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10,),
          
          MyButton(
            text: "Get Started", 
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthGate()),
              );
            },)
          
        ],
      ),
    );
  }
}

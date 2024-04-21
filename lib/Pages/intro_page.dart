import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/auth/auth_gate.dart';
import 'package:sticher/components/buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.only(top: 8, left: 20),
            child: Text(
              "STITCHER",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 50,
                color: Color.fromRGBO(45,149, 150, 10),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset('lib/images/sewing.png'),
          ),

          const SizedBox(height: 25,),

          Container(
            child: Text(
              "Something new!",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Color.fromRGBO(45,149, 150, 10),
              ),
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

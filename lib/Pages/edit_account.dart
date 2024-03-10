import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Account",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.purple.shade300,
          ),
          width: 500,
          height: 600,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: const Icon(
                  Icons.person,
                  size: 200,
                ),
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Name",
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "UserName",
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Phone Number",
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "9658457125",
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Email ID",
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Test@gmail.com",
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Location",
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Mangalore",
                      style: GoogleFonts.lato(
                        decoration: TextDecoration.underline,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 100,
                height: 30,
                child: Center(
                  child:
                  Text("Done",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

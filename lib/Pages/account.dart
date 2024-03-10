import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/Pages/edit_account.dart';
import 'package:sticher/auth/auth_service.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final AuthService _authService = AuthService();
  Map<String, dynamic>? userData;
  String? currentUserEmail;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      currentUserEmail = await _authService.getCurrentUserEmail();
      Map<String, dynamic> data = await _authService.getUserData(currentUserEmail!);

      setState(() {
        userData = data;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Account",
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
                      userData?['name'] ?? "Loading...",
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
                      userData?['phone'] ?? "Loading...",
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
                      userData?['email'] ?? "Loading...",
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
                      userData?['location'] ?? "Loading...",
                      style: GoogleFonts.lato(
                        decoration: TextDecoration.underline,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20,),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditAccount()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 100,
                  height: 30,
                  child: Center(
                    child:
                    Text("Edit",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                      ),
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

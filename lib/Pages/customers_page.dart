import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/components/customer_tile.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C u s t o m e r s",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple.shade500,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: CustomerTile(
              name: 'Customer1',
              location: 'Mangalore',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: CustomerTile(
              name: 'Customer2',
              location: 'Mangalore',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: CustomerTile(
              name: 'Customer3',
              location: 'Bangalore',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: CustomerTile(
              name: 'Customer4',
              location: 'Mangalore',
            ),
          ),Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: CustomerTile(
              name: 'Customer5',
              location: 'Mangalore',
            ),
          ),

        ],
      ),
    );
  }
}


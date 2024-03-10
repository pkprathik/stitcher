import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/components/pending_order_tile.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PENDING ORDERS",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple.shade500,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: PendingOrderTile(
                phone: "98557485744",
                  orderlist: "lehenga",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: PendingOrderTile(
                phone: "98557485744",
                orderlist: "lehenga",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: PendingOrderTile(
                phone: "98557485744",
                orderlist: "lehenga",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: PendingOrderTile(
                phone: "98557485744",
                orderlist: "lehenga",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

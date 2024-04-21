import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/class/pending_order_data.dart';
import 'package:sticher/components/pending_order_tile.dart';

import '../auth/auth_service.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  final AuthService _authService = AuthService();
  String? currentUserEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void deleteOrder(String documentId) async {
    try {
      User? user = _auth.currentUser;
      currentUserEmail = await _authService.getCurrentUserEmail();
      if (currentUserEmail != null) {
        final CollectionReference ordersCollection =
        FirebaseFirestore.instance.collection('orders');

        await ordersCollection
            .doc(currentUserEmail)
            .collection('data')
            .doc(documentId)
            .delete();

        setState(() {});
      }
    } catch (e) {
      print("Error deleting order: $e");
    }
  }

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
      body: FutureBuilder<List<PendingOrderData>>(
        future: _fetchPendingOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No pending orders available."),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: snapshot.data!
                    .map((orderData) => Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: PendingOrderTile(
                    phone: orderData.phone,
                    orderlist: orderData.orderlist,
                    cost: orderData.cost,
                    onDelete: () => deleteOrder(orderData.documentId),
                    onDone: (value) {
                      storePriceInFirestore(orderData.documentId, value);
                    },
                  ),
                ))
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<PendingOrderData>> _fetchPendingOrders() async {
    try {
      User? user = _auth.currentUser;
      currentUserEmail = await _authService.getCurrentUserEmail();
      if (currentUserEmail != null) {
        // Replace 'orders' with the actual collection name in your Firestore database
        final CollectionReference ordersCollection =
        FirebaseFirestore.instance.collection('orders');

        QuerySnapshot querySnapshot =
        await ordersCollection.doc(currentUserEmail).collection('data').get();

        return querySnapshot.docs.map((doc) {
          return PendingOrderData(
            documentId: doc.id,
            phone: doc['customerNumber'],
            orderlist: doc['orderList'],
            cost: doc['cost'],
          );
        }).toList();
      }

      return [];
    } catch (e) {
      throw e;
    }
  }

  Future<void> storePriceInFirestore(String documentId, String newPrice) async {
    try {
      currentUserEmail = await _authService.getCurrentUserEmail();
      final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

      await ordersCollection
          .doc(currentUserEmail) // Assuming currentUserEmail is defined in your widget state
          .collection('data')
          .doc(documentId)
          .update({'cost': newPrice});

      setState(() {});

      // Optional: Show a success message or perform any other actions
    } catch (e) {
      // Handle errors
      print('Error updating price: $e');
    }
  }

}


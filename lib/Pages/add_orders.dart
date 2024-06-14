import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticher/Pages/pending_orders.dart';
import 'package:sticher/auth/auth_service.dart';
import 'package:sticher/components/buttons.dart';
import 'package:sticher/components/my_textfields.dart';

class AddOrders extends StatelessWidget {


  final AuthService _authService = AuthService();
  String? currentUserEmail;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _orderListController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD ORDERS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 10,),
            child: Row(
              children: [
                Text(
                    "Customer Mobile Number:",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          MyTextField(
              controller: _phoneController,
            obsecureText: false,
            hintText: "(+91 * * * * * * * * * * )",
            color: Colors.grey.shade600,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 10,),
            child: Row(
              children: [
                Text(
                  "Customer Name:",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          MyTextField(
            controller: _nameController,
            obsecureText: false,
            hintText: "Name",
            color: Colors.grey.shade600,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 10,),
            child: Row(
              children: [
                Text(
                  "Customer Order List",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          MyTextField(
            controller: _orderListController,
            obsecureText: false,
            hintText: "List",
            color: Colors.grey.shade600,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 10,),
            child: Row(
              children: [
                Text(
                  "Description of Orders",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          MyTextField(
            controller: _descriptionController,
            obsecureText: false,
            hintText: "Description",
            color: Colors.grey.shade600,
          ),

          const SizedBox(height: 20,),

          MyButton(
              onTap: () => _addOrder(context),
              text: "ADD"
          )
        ],
      ),
    );
  }

  //add orders
  Future<void> _addOrder(BuildContext context) async {
    try {
      String customerNumber = _phoneController.text;
      String customerName = _nameController.text;
      String orderList = _orderListController.text;
      String description = _descriptionController.text;

      // Validate if any of the fields are empty
      if (customerNumber.isEmpty ||
          customerName.isEmpty ||
          orderList.isEmpty ||
          description.isEmpty) {
        // Show an error message or handle it accordingly
        return;
      }


      final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

      currentUserEmail = await _authService.getCurrentUserEmail();
      await ordersCollection.doc(currentUserEmail).collection('data').add({
        'customerNumber':customerNumber,
        'customerName': customerName,
        'orderList': orderList,
        'description': description,
        'cost' : "0",
      });

      // Optional: Show a success message or navigate to another screen
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => PendingOrder())
      );

    } catch (e) {
      // Handle errors
      print('Error adding order: $e');
    }
  }
}

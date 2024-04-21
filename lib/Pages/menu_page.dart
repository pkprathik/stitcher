import 'package:flutter/material.dart';
import 'package:sticher/Pages/account.dart';
import 'package:sticher/Pages/add_orders.dart';
import 'package:sticher/Pages/customers_page.dart';
import 'package:sticher/Pages/pending_orders.dart';
import 'package:sticher/Pages/total_profit.dart';
import 'package:sticher/auth/auth_service.dart';
import 'package:sticher/components/my_custom_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

final authservice = AuthService();

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "S T I T C H E R",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(

        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                child: MyCustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddOrders()),
                      );
                    },
                    icon:Icons.add_box_outlined,
                    label: "Add Orders"
                ),
              ),

              Container(
                padding: const EdgeInsets.all(18),
                child: MyCustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PendingOrder()),
                      );
                    },
                    icon:Icons.shopping_bag,
                    label: " Pending Orders"
                ),
              )
            ],
          ),
          Row(
            children: [
              // Container(
              //   padding: const EdgeInsets.all(18),
              //   child: MyCustomButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => AddOrders()),
              //         );
              //       },
              //       icon:Icons.add_box_outlined,
              //       label: "Add Orders"
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.all(18),
                child: MyCustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyAccount()),
                      );
                    },
                    icon:Icons.person_2_outlined,
                    label: "Account"
                ),
              ),

              Container(
                padding: const EdgeInsets.all(18),
                child: MyCustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TotalProfit()),
                      );
                    },
                    icon:Icons.wallet_sharp,
                    label: "Total Profit"
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: MyCustomButton(
                      onPressed: () {
                        authservice.signOut();
                      },
                      icon:Icons.logout,
                      label: "Logout"
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
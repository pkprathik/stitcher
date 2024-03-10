import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingOrderTile extends StatelessWidget {
  final String phone;
  final String orderlist;

  const PendingOrderTile({
    super.key,
    required this.phone,
    required this.orderlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.purple.shade400,
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person,size: 75,),

              const SizedBox(width: 20,),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,right: 40),
                    child: Row(
                      children: [
                        Text(
                          "PHONE NUMBER",
                          style: GoogleFonts.lato(
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 30,),

                  Container(
                    width: 200,
                    color: Colors.white60,
                    child: Text(
                      phone,
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color:Colors.grey.shade900
                      ),
                    ),
                  ),

                  const SizedBox(height: 8,),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 85),
                    child: Row(
                      children: [
                        Text(
                          "ORDER LIST:",
                          style: GoogleFonts.lato(
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5,),

                  Container(
                    width: 200,
                    height: 50,
                    color: Colors.white60,
                    child: Text(
                      orderlist,
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: Colors.grey.shade900
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 30,right: 25,top: 6),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),

                  child: Text("DONE")
              ),
              const SizedBox(width: 50,),
              Container(
                  padding: EdgeInsets.only(left: 30,right: 25,top: 6),
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),

                  child: Text("REMOVE")
              ),
            ],
          ),
        ],
      ),
    );
  }
}

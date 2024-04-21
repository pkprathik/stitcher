import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingOrderTile extends StatelessWidget {
  final String phone;
  final String orderlist;
  final String cost;
  final VoidCallback onDelete;
  final Function(String) onDone;

  const PendingOrderTile({
    Key? key,
    required this.phone,
    required this.orderlist,
    required this.cost,
    required this.onDelete,
    required this.onDone,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: cost);


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
              const Column(
                children: [
                  Icon(Icons.person,size: 75,),
                ],
              ),

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

          _controller.text != "0"
          ?Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // padding: EdgeInsets.only(top: 8),
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color:Colors.grey.shade900
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onDone(_controller.text);
                },
                child: Container(
                    padding: EdgeInsets.only(left: 25,right: 25,top: 6),
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Text("EDIT")
                ),
              ),
              // const SizedBox(width: 50,),
              GestureDetector(
                onTap: onDelete,
                child: Container(
                    padding: EdgeInsets.only(left: 22,right: 15,top: 6),
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                    ),
                    child: Text("FINISH")
                ),
              ),
            ],
          )
          :Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // padding: EdgeInsets.only(top: 8),
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color:Colors.grey.shade900
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onDone(_controller.text);
                },
                child: Container(
                    padding: EdgeInsets.only(left: 25,right: 25,top: 6),
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: Text("DONE")
                ),
              ),
              // const SizedBox(width: 50,),
              GestureDetector(
                onTap: onDelete,
                child: Container(
                    padding: EdgeInsets.only(left: 16,right: 15,top: 6),
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    child: Text("REMOVE")
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

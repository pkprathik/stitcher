import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerTile extends StatelessWidget {
  final String name;
  final String location;

   const CustomerTile({
     super.key,
     required this.name,
     required this.location,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.purple.shade400,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
        children: [
           Row(
            children: [
              Icon(Icons.person,size: 75,),
               Column(
                children: [
                    Row(
                    children: [
                      Text(
                          "NAME:",
                        style: GoogleFonts.lato(
                            fontSize: 20
                        ),
                      ),

                      const SizedBox(width: 30,),

                      Container(
                        width: 120,
                        color: Colors.white60,
                        child: Text(
                          name,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                            color:Colors.grey.shade900
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    children: [
                      Text(
                        "LOCATION:",
                        style: GoogleFonts.lato(
                          fontSize: 20
                        ),
                      ),

                      const SizedBox(width: 5,),

                      Container(
                        width: 100,
                        color: Colors.white60,
                        child: Text(
                          location,
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 25,right: 25,top: 2),
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                
                  child: Text("DELETE")
              ),
              const SizedBox(width: 50,),
              Container(
                  padding: EdgeInsets.only(left: 38,right: 30,top: 2),
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow,
                  ),

                  child: Text("EDIT")
              ),
            ],
          ),
        ],
      ),
    );
  }
}

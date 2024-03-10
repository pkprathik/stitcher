import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final double width;
  final double height;

  const MyCustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.width = 160.0,
    this.height = 160.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          // color: Colors.purple.shade300,
          decoration: BoxDecoration(
            color: Colors.purple.shade900,
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50.0, // Adjust the icon size as needed
                color: Colors.purple.shade200, // Adjust the icon color as needed
              ),
              SizedBox(height: 8.0), // Adjust the space between icon and text as needed
              Text(
                label,
                style: TextStyle(
                  fontSize: 18.0, // Adjust the text size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

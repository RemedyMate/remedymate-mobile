import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF0B2D48), 
                child: Text(
                  "R",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "RemedyMate",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0B2D48)),
              ),
            ],
          ),

       
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration:  BoxDecoration(

              
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFF0B2D48), 
            ),
            child: const Text(
              "EN ↔ Amh",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

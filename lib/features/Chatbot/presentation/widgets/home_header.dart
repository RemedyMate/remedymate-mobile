import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

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
          
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryDeepBlue, 
                child: Text(
                  'R',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'RemedyMate',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryDeepBlue),
              ),
            ],
          ),

       
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration:  BoxDecoration(

              
              borderRadius: BorderRadius.circular(25),
              color: AppColors.primaryDeepBlue, 
            ),
            child: const Text(
              'EN ↔ Amh',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

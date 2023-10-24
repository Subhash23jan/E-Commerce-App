
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
class TopAccessories extends StatelessWidget {
  const TopAccessories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      height: 75,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                ClipOval(
                  child: Image.asset(
                  GlobalVariables.categoryImages[index]['image']!,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
                ),
                 Text(GlobalVariables.categoryImages[index]['title']!,style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
      },),
    );
  }
}

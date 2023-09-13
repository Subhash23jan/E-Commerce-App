import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      margin: const EdgeInsets.only(right: 4,left: 2,top: 8),
      decoration: BoxDecoration(
        color: GlobalVariables.greyBackgroundColor,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(fit: BoxFit.fill,"https://assets-in.bmscdn.com/discovery-catalog/events/et00351665-wcxbpmaede-landscape.jpg",width: 100,height: 150,),
          Text("Annana Nenappu",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.blue.shade700,fontSize: 19),),
          Text("₹201.00",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
        ],
      ),
    );
  }
}

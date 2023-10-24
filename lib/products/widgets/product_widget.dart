import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});
  //final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 280,
      margin: const EdgeInsets.only(right: 6,left: 2,top: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
      ),
      padding: const EdgeInsets.only(top: 2),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(fit: BoxFit.fill,"https://assets-in.bmscdn.com/discovery-catalog/events/et00351665-wcxbpmaede-landscape.jpg",
            width: 165,height: 185,),
          Text("Annana Nenapu",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.blue.shade700,fontSize: 15),),
          Text("₹201.00",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15),),
        ],
      ),
    );
  }
}

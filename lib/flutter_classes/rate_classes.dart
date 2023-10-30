import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductRates{
  Widget getRate(double rate,double offer,double fontSize, {String offerReason = "Great Indian Festival"})
  {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red.shade900,
            ),
            height: 28,
            alignment: Alignment.center,
            width: 200,
            child: const Text("Great Indian Festival",style: TextStyle(color: Colors.white,fontSize: 14),),
          ),
          Row(
            children: [
              Text("-$offer%",style: TextStyle(color:Colors.red,fontSize: fontSize,fontWeight: FontWeight.w200),),
              Text("  ₹${(offer*0.01*rate).round()}",style: GoogleFonts.aBeeZee(color:Colors.black,fontSize: fontSize),),
            ],
          ),
          Text("M.R.P. : ₹$rate ",style: TextStyle(color:Colors.grey,fontSize: fontSize*0.45,fontWeight: FontWeight.bold,
              decoration:TextDecoration.lineThrough,decorationThickness: 2)),
        ],
      ),
    );
  }
}
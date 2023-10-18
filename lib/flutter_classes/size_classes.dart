import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sizes{
  Widget shoeSize()
  {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right:15,left: 8 ),
            width: 70,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape:BoxShape.rectangle,
              color: Colors.white70,
              border: Border.all(color: Colors.black54,width: 1.5)
            ),
            child: Text("6UK",style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            width: 70,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                color: Colors.white70,
                border: Border.all(color: Colors.black54,width: 1.5)
            ),
            child: Text("8UK",style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            width: 70,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                color: Colors.white70,
                border: Border.all(color: Colors.black54,width: 1.5)
            ),
            child: Text("9UK",style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            width: 70,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                color: Colors.white70,
                border: Border.all(color: Colors.black54,width: 1.5)
            ),
            child: Text("10UK",style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            width: 70,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                color: Colors.white70,
                border: Border.all(color: Colors.black54,width: 1.5)
            ),
            child: Text("11UK",style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),),
          ),
        ],
      ),
    );
  }
}
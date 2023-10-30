
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/global_variables.dart';
Container cartItem()
{
  return Container(
    color: GlobalVariables.greyBackgroundColor.withOpacity(0.1),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 220,
              width: 200,
              child: Stack(
                children: [
                  // Positioned(child:Transform.scale(
                  //   scale: 1.3,
                  //   child: Checkbox(
                  //     activeColor: Colors.blue,
                  //     value: true, onChanged:(val){},checkColor: Colors.white,),
                  // ),),
                  Positioned(top: 28,left: 20,
                      child: SizedBox(
                          width: 160,height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                              child: Image.network("https://m.media-amazon.com/images/I/91L1cOyTQmL._AC_UF1000,1000_QL80_.jpg",fit: BoxFit.fill,)))),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sachin Tendulkar",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),softWrap: true,),
                Text("by Sachin Tendulkar",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.5,fontStyle: FontStyle.italic),),
                Text("Paper back",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                Text("₹250.00",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.5),),
                Text("eligible for free shipping!!",style: GoogleFonts.aBeeZee(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14.5),),
                Text("in stock",style: GoogleFonts.aBeeZee(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 14.5),),
                Text("10 days Replacement",style: GoogleFonts.aBeeZee(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 14.5),),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2.3),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    decoration:   const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))
                    ),
                    child: const Icon(Icons.remove_rounded,color: Colors.black87,size: 18,),
                  ),
                  Container(
                    width: 60,
                    height: 30,
                    alignment: Alignment.center,
                    decoration:   const BoxDecoration(
                      color: Colors.white,

                    ),
                    child: const Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  ),
                  Container(
                    width: 50,
                    height: 30,
                    decoration:const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                    ),
                    child: const Icon(Icons.add,color: Colors.black87,size: 18,),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 30,
                  alignment: Alignment.center,
                  decoration:    BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 1.5,
                        spreadRadius: 0.1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  Text("Delete",style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.w700),),
                ),
                const SizedBox(width: 5,),
                Container(
                  width: 110,
                  height: 30,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 1.5,
                        spreadRadius: 0.1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child:  Center(child: Text("Save for later",style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.w700),)),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 18,left: 13.5),
          width: 160,
          height: 33,
          decoration:BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1.8),
                blurRadius: 1.5,
                spreadRadius: 0.1,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child:  Center(child: Text("See more like this",style: GoogleFonts.openSans(fontSize: 14.5,fontWeight: FontWeight.w700),)),
        ),
      ],
    ),
  );
}

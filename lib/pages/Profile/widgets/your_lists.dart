import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class YourLists extends StatelessWidget {
  const YourLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12,),
      padding: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey,
                  width: 2
              )
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Lists",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
              Text("See all",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600,color: Colors.cyan,fontSize: 16),),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 120,
            width:MediaQuery.of(context).size.width*0.9,
            decoration:  BoxDecoration(
                border: Border.all(
                  color: Colors.black87
                ),
              borderRadius: BorderRadius.circular(12)
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Shopping List",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w700,color: Colors.black87,fontSize: 15),),
                      Text("Private-Default",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 15),),
                    ],
                  ),
                 ClipRRect(
                   borderRadius: BorderRadius.circular(12),
                   child: Container(
                     margin: const EdgeInsets.only(right: 12),
                     color: Colors.grey,
                     width: 100,
                     child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSADfDsdVO4ASoDspLSDg7fqDCmOKQsar8t3RhH5VEMbNgiZVsgN_haIFKtgcQbTBo6dP4&usqp=CAU",
                    fit: BoxFit.fill,
                        ),
                   ),
                 )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class YourAccount extends StatelessWidget {
  const YourAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
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
              Text("Your Account",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15),),
              Text("See all",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600,color: Colors.cyan,fontSize: 15),),

            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 180,
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          child:Text("Your Addresses",
                              style: GoogleFonts.aBeeZee(color: Colors.black,
                                  fontSize: 14.5,fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 350,
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          child:Text("Top-up your Amazon Pay Wallet",
                              style: GoogleFonts.aBeeZee(color: Colors.black,
                                  fontSize: 14.5,fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          child:Text("Amazon Prime Service",
                              style: GoogleFonts.aBeeZee(color: Colors.black,
                                  fontSize: 14.5,fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          child:Text("Saved Information",
                              style: GoogleFonts.aBeeZee(color: Colors.black,
                                  fontSize: 14.5,fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

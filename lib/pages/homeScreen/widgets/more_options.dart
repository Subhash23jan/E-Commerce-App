import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8,bottom: 5,left: 5,right: 5),
      height: 100,
      child: Card(
        elevation: 12,
        child: GridView.count(

          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio:2.8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 18),
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          children: [
            Card(
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                      ),
                      child:Text("Admin login",
                          style: GoogleFonts.aBeeZee(color: Colors.black,
                              fontSize: 18,fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white70,

                  ),
                  child:Text("Manage orders",
                      style: GoogleFonts.aBeeZee(color: Colors.black,
                          fontSize: 18,fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(12),
            //   child: Card(
            //     elevation: 8,
            //     child: Container(
            //       alignment: Alignment.center,
            //       decoration: const BoxDecoration(
            //         color: Colors.white70,
            //
            //       ),
            //       child:Text("Amazon Pay",
            //           style: GoogleFonts.aBeeZee(color: Colors.black,
            //               fontSize: 18,fontWeight: FontWeight.w600)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

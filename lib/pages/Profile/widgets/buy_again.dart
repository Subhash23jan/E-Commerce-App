import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BuyAgain extends StatelessWidget {
  const BuyAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Buy Again",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 40,
                child: Text("See what others are reordering on Buy Again",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 16),)
            ),
          ],
        ),
      ),
    );
  }
}

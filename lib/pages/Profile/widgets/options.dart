import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      color: GlobalVariables.backgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(160, 48),
                  shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )
              ), child:Text("Your Orders",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17),),),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(160, 48),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ), child:Text("Buy Again",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17),),),          ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(160, 48),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ), child:Text("Your Account",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17),),),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(160, 48),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ), child:Text("Your Lists",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17),),),          ],
          ),
        ],
      ),
    );
  }
}

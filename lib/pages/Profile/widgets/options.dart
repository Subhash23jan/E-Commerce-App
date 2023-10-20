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
                elevation: 5,backgroundColor:Colors.white,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                borderRadius: BorderRadius.circular(10),
              )
              ), child:Text("Your Orders",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Buy Again",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),          ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Your Account",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Your Lists",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),          ],
          ),
        ],
      ),
    );
  }
}

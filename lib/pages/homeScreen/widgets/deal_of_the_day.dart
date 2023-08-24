
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      margin: const EdgeInsets.symmetric(horizontal: 11,vertical: 5),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
             Center(child: Text("Deal of the day",
              style: GoogleFonts.aBeeZee(color: Colors.black87,fontSize: 19,fontWeight: FontWeight.w700))),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSADfDsdVO4ASoDspLSDg7fqDCmOKQsar8t3RhH5VEMbNgiZVsgN_haIFKtgcQbTBo6dP4&usqp=CAU",
                   fit: BoxFit.fitWidth,),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(" 14-inch MacBook Pro with 16GB Unified Memory 512GB SSD Storage",
                  style: GoogleFonts.aBeeZee(color: Colors.black87,fontSize: 19,fontWeight: FontWeight.w700,
                      textStyle: const TextStyle( overflow: TextOverflow.ellipsis,))),
            ),
            Text(" Rs.109999.00",
                style: GoogleFonts.jetBrainsMono(color: Colors.black87,fontSize: 19,fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

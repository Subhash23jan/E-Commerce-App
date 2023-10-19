import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/main.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/screens/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class YourOrders extends StatelessWidget {
  const YourOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 2.5
            )
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Orders",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
             Container(
               margin: const EdgeInsets.symmetric(vertical: 5),
              height: 40,
              child: Text("Hii!! You have no recent orders!!.",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 16),)
            ),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
                },
                child: Container(
                  height: 55,
                  width:MediaQuery.of(context).size.width*0.9,
                 alignment: Alignment.center,
                 decoration:  BoxDecoration(
                   color: Colors.white12,
                   border: Border.all(color: Colors.black87),
                   borderRadius:BorderRadius.circular(12)
                 ),
                 child: Text("Return to the Homepage",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

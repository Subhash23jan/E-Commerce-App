import 'package:amazon_clone_flutter/main.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/screens/home_screen_page.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OptionalBottomSheet extends StatefulWidget {
  const OptionalBottomSheet({super.key});

  @override
  State<OptionalBottomSheet> createState() => _OptionalBottomSheetState();
}

class _OptionalBottomSheetState extends State<OptionalBottomSheet> with TickerProviderStateMixin {
 late final AnimationController ? _controller;
  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync:this,duration:const Duration(milliseconds: 600));
    Future.delayed(Duration.zero,() => moreOptionSheet(context));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }
  Future moreOptionSheet( BuildContext context){
    return showModalBottomSheet(
      backgroundColor: Colors.black,
      transitionAnimationController:_controller,
      isDismissible: true,
      useSafeArea: true,
      context:context , builder: (context) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
         Future.delayed(const Duration(milliseconds:200),() =>  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(),)),);
        },
        child: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border(top: BorderSide(color: Colors.grey.shade700,width: 8.2))
        ),
        height: 400,
        width: MediaQuery.sizeOf(context).width,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text("Do More With Amazon",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),),
              ],
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54,width: 1),
                color: Colors.grey.shade300,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Icon(Icons.qr_code_scanner_outlined,color: Colors.grey.shade900,size: 40,),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Tap here enable camera",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 15),),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: const Border(top: BorderSide(color: Colors.black54,width: 1)),
                      color: Colors.green.shade100,
                    ),
                    child:  Text("Scan any QR to Pay",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
   // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProductPage(productId: "productId"),));
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      // child: GestureDetector(
      //   onTap: () {
      //     Future.delayed(Duration.zero,() =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),)),);
      //   },
      // ),
    );
  }
}

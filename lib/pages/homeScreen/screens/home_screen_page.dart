import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/addressBox.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/corousels.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/deal_of_the_day.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/more_options.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/top_accessories.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/top_deals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final searchController=TextEditingController();
  late   Size? _size;
  @override
  Widget build(BuildContext context) {
    _size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(66),
        child: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient
          ),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.white,
                    width:300,
                    child: TextFormField(
                      controller: searchController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                          suffixIcon:Icon(Icons.camera_enhance_outlined,color: Colors.grey,size: 28,),
                        prefixIcon:Icon(Icons.search,color: Colors.grey,size: 32,),
                        hintText: "Search in Amazon.in",
                        hintStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 18)
                      ),
                    ),
                  ),
                  const Icon(Icons.keyboard_voice_rounded,color: Colors.black,size: 31,)
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:  [
             addressBox(),
            const TopAccessories(),
            const TopDeals(),
            const DealOfTheDay(),
            const CarouselItems(),
            Container(
              margin: const EdgeInsets.only(top: 18,left: 22),
              alignment:Alignment.centerLeft,
              child: Text("More options",
                  style: GoogleFonts.aBeeZee(color: Colors.black87,fontSize: 21,fontWeight: FontWeight.w700)),
            ),
            const MoreOptions(),
            const SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}

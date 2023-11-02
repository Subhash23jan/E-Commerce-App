import 'dart:async';

import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/products/product_page.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/addressBox.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/corousels.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/deal_of_the_day.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/more_options.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/top_accessories.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/top_deals.dart';
import 'package:amazon_clone_flutter/products/screens/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final searchController=TextEditingController();
  bool _isDoubleClicked = false;
  final int _doubleClickInterval = 2000;
  late   Size? _size;
  @override
  Widget build(BuildContext context) {
    _size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(86),
        child: Container(
            padding: const EdgeInsets.only(top: 50,bottom: 12),
            decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),

                  width:360,
                  child: TextFormField(
                    controller: searchController,
                    onFieldSubmitted: (value) {

                    },
                    textAlign: TextAlign.start,
                    decoration:   InputDecoration(
                        border: InputBorder.none,
                        suffixIcon:SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                  child: const Icon(CupertinoIcons.camera,color: Colors.grey,size: 22.5,)),
                              InkWell(
                                onTap: () {

                                },
                                  child: const Icon(Icons.keyboard_voice,color: Colors.grey,size: 23,)),

                            ],
                          ),
                        ),
                        prefixIcon:const Icon(Icons.search,color: Colors.grey,size: 26,),
                        hintText: "Search in Amazon.in",
                        hintStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 14)
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
      body: WillPopScope(
        onWillPop: () => _onWillPop(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:  [
               addressBox(),
              const TopAccessories(),
               InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage(productId: "653df7a39f565b003158d274"),));
                 },
                   child: const TopDeals()),
              const DealOfTheDay(),
              const CarouselItems(),
              Container(
                margin: const EdgeInsets.only(top: 18,left: 22),
                alignment:Alignment.centerLeft,
                child: Text("More options",
                    style: GoogleFonts.aBeeZee(color: Colors.black87,fontSize: 17.5,fontWeight: FontWeight.w700)),
              ),
              const MoreOptions(),
              const SizedBox(height: 25,)
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 16,
          onPressed: (){
          showSnackBar("sorry!! It is not real amazon app..🙅", context);
          },child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
          child: Image.network("https://cdn.icon-icons.com/icons2/2108/PNG/512/amazon_alexa_icon_130998.png",width: 120,height: 120,)), ),

    );
  }
  Future<bool> _onWillPop() async {
    showSnackBar("press again to exit", context);
    if (_isDoubleClicked) {
      return true; // Allow exiting the app
    }

    // Set a flag for double-click within the specified interval
    _isDoubleClicked = true;
    Timer(Duration(milliseconds: _doubleClickInterval), () {
      _isDoubleClicked = false;
    });
    return false; // Prevent exiting the app
  }
}

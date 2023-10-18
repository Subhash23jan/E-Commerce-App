import 'package:amazon_clone_flutter/flutter_classes/rate_classes.dart';
import 'package:amazon_clone_flutter/flutter_classes/size_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/global_variables.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final searchController=TextEditingController();
  int ?sizeSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(86),
        child: Container(
          padding: const EdgeInsets.only(top: 50,bottom: 18),
          decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient
          ),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){},
                      child: const Icon(Icons.arrow_back,size: 28,)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),

                    width:350,
                    child: TextFormField(
                      controller: searchController,
                      textAlign: TextAlign.start,
                      decoration:  const InputDecoration(
                          border: InputBorder.none,
                          suffixIcon:SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_enhance_outlined,color: Colors.grey,size: 28,),
                                Icon(Icons.keyboard_voice,color: Colors.grey,size: 28,),

                              ],
                            ),
                          ),
                          prefixIcon:Icon(Icons.search,color: Colors.grey,size: 32,),
                          hintText: "Search in Amazon.in",
                          hintStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 18)
                      ),
                    ),
                  ),
                ],
              )
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: CupertinoColors.tertiarySystemBackground,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Red Tape Men's Sneakers",style: GoogleFonts.aBeeZee(color: Colors.grey.shade700,fontSize: 19),),
              const SizedBox(height: 4,),
              Stack(
                children: [
                  const Positioned(
                    right: 5,
                      child: Icon(Icons.share_outlined,size: 32,color: Colors.black,)),
                  const Positioned(
                    bottom: 9,
                      left: 6,
                      child: Icon(Icons.favorite_outline,size:32 ,)),
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                        border:Border(
                          bottom: BorderSide(
                            width: 4,
                            color: Colors.black12
                          )
                        )
                      ),
                    alignment: Alignment.center,
                    height: 350,
                    width: MediaQuery.of(context).size.width,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/shoes.png',height: 250,width: MediaQuery.of(context).size.width*0.8,fit: BoxFit.fill,)),
                ),
                  )],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Size : ${sizeSelected??""}",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),),
              Sizes().shoeSize(),
              const SizedBox(height: 20,),
              ProductRates().getRate(5999, 58.09,38),

            ],
          ),
        ),
      ),
    );
  }
}

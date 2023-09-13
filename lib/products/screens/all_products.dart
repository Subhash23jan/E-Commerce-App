import 'package:amazon_clone_flutter/products/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/global_variables.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
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
      body:  Container(
        margin: const EdgeInsets.only(left: 10,right: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Choose what you want!!!",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type of products",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19),),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Product(),
                        Product(),
                        Product(),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type of products",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19),),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Product(),
                        Product(),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type of products",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19),),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Product(),
                        Product(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

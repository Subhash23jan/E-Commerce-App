import 'package:amazon_clone_flutter/products/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
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
          preferredSize:const Size.fromHeight(86),
          child: Container(
              padding: const EdgeInsets.only(top: 35,bottom: 5),
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
      body:  Container(
        margin: const EdgeInsets.only(left: 10,right: 5,top: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Choose What You Want..!!!",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 19),),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration:  BoxDecoration(
                  color: Colors.grey.shade100,
                  border:Border(bottom: BorderSide(color: Colors.black,width: 1))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type of products",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 17),),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProductWidget(productId: "653df7a39f565b003158d274")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration:  BoxDecoration(
                    color: Colors.grey.shade100,
                    border:const Border(bottom: BorderSide(color: Colors.black,width: 1))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type of products",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 17),),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // ProductWidget(),
                          // ProductWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration:  BoxDecoration(
                    color: Colors.grey.shade100,
                    border:const Border(bottom: BorderSide(color: Colors.black,width: 1))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type of products",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19),),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // ProductWidget(),
                          // ProductWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:amazon_clone_flutter/flutter_classes/rate_classes.dart';
import 'package:amazon_clone_flutter/flutter_classes/size_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constants/global_variables.dart';
import '../../../products/widgets/product_widget.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String formattedDate = DateFormat('EEEE , dd MMMM').format(DateTime.now());
  final searchController=TextEditingController();
  int ?sizeSelected;
  @override
  Widget build(BuildContext context) {
    int? quantity=1;
    return Scaffold(
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
              const SizedBox(height: 15,),
              RichText(text: TextSpan(
                children:[
                  TextSpan(
                    text: "Free Delivery   ",
                    style: GoogleFonts.aBeeZee(color: Colors.cyan,fontSize: 18)
                  ),
                  TextSpan(
                    text: formattedDate,
                    style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)
                  )
                ]
              )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.location_on,color: Colors.grey,size: 24,),
                  const SizedBox(width: 12,),
                  Text("user location",style: GoogleFonts.aBeeZee(color: Colors.cyan.shade600,fontSize: 21),)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("In stock",style: GoogleFonts.aBeeZee(color: Colors.green,fontWeight: FontWeight.w700,
                  fontSize: 22),),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 8,
                shadowColor: Colors.black,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black,width: 1),
                    color: Colors.grey.shade300,
                  ),
                  width: 90,
                  alignment: AlignmentDirectional.centerEnd,
                  height: 40,
                  child:DropdownButton<int>(

                    value: quantity,
                    iconSize: 33,
                    style: const TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w400),
                    menuMaxHeight: 200,
                    borderRadius: BorderRadius.circular(12),
                    alignment: Alignment.center,
                    elevation: 16,
                    icon:const Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Icon(Icons.arrow_drop_down_sharp,color: Colors.black,),
                    ),
                    items:<int>[1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        alignment: Alignment.center,
                        value: value, child: Text(value.toString(),textAlign: TextAlign.center),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        quantity=value;
                      });
                    },
                  )
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.only(top: 25,bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Colors.yellow.shade900,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.9,
                    alignment: Alignment.center,
                    child:Text("Add to Cart",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),)
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.only(top: 8,bottom: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Colors.yellowAccent.shade700,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.9,
                    alignment: Alignment.center,
                    child:Text("Buy it Now",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),)
                ),
              ),
              Container(
                height: 2,
                margin: const EdgeInsets.only(bottom: 12),
                decoration:  BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade400,width: 3))
                ),
              ),
              Text("Recommended Products",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.w700,
                  fontSize: 18),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                height: 260,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                  return  const ProductWidget();
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

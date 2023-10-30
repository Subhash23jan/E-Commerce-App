import 'dart:convert';
import 'dart:ui';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/flutter_classes/rate_classes.dart';
import 'package:amazon_clone_flutter/flutter_classes/size_classes.dart';
import 'package:amazon_clone_flutter/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  ProductModel ? productModel;
  List<ProductModel>  recommended=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct(widget.productId);
  }
  @override
  Widget build(BuildContext context) {
    int? quantity=1;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(76),
        child: Container(
          padding: const EdgeInsets.only(top: 40,bottom: 12),
          decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient
          ),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      if (kDebugMode) {
                        print("clicked");
                      }
                      Navigator.maybePop(context);
                    },
                      child: const Icon(Icons.arrow_back,size: 24,)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),

                    width:320,
                    height: 40,
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
                                Icon(CupertinoIcons.camera,color: Colors.grey,size: 24,),
                                Icon(Icons.keyboard_voice,color: Colors.grey,size: 24,),

                              ],
                            ),
                          ),
                          prefixIcon:Icon(Icons.search,color: Colors.grey,size: 27,),
                          hintText: "Search in Amazon.in",
                          hintStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 15)
                      ),
                    ),
                  ),
                ],
              )
        ),
      ),
      body: productModel==null?const Center(child: CircularProgressIndicator(color: Colors.blue,)):SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: CupertinoColors.tertiarySystemBackground,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          padding: const EdgeInsets.only(left: 8,top: 1,bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8,top: 8),
                child: Text(productModel!.name,style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17.5,fontWeight: FontWeight.w700,
                  decorationStyle: TextDecorationStyle.solid,)),
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration:  const BoxDecoration(
                          color: Colors.white12,
                        border:Border(
                          bottom: BorderSide(
                            width: 4,
                            color: Colors.black12
                          )
                        )
                      ),
                    alignment: Alignment.center,
                    height: 260,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),

                        child: Image.network(productModel!.url,height: 250,width: MediaQuery.of(context).size.width*0.75,fit: BoxFit.fill,)),
                ),
                  ),
                  const Positioned(
                      right: 1.1,
                      top: 1,
                      child: Icon(CupertinoIcons.share,size: 26,color: Colors.black,)),
                  const Positioned(
                      bottom: 9,
                      left: 1,
                      child: Icon(Icons.favorite_outline,size:26 ,)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Size : ${sizeSelected??""}",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15.5,fontWeight: FontWeight.bold),),
              Sizes().shoeSize(),
              const SizedBox(height: 2,),
              ProductRates().getRate(productModel!.price*1.2.toDouble(), 58.09,24),
              const SizedBox(height: 2,),
              const SizedBox(height: 15,),
              RichText(text: TextSpan(
                children:[
                  TextSpan(
                    text: "Free Delivery !!  ",
                    style: GoogleFonts.aBeeZee(color: Colors.red,fontSize: 15)
                  ),
                  TextSpan(
                    text: formattedDate,
                    style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                  )
                ]
              )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.location_on,color: Colors.grey,size: 22,),
                  const SizedBox(width: 6,),
                  Text("user location",style: GoogleFonts.aBeeZee(color: Colors.cyan.shade600,fontSize: 16),)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("In stock",style: GoogleFonts.aBeeZee(color: Colors.green,fontWeight: FontWeight.w700,
                  fontSize: 17),),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 8,
                shadowColor: Colors.black,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
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
                    style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
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
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.70,
                    alignment: Alignment.center,
                    child:Text("Add to Cart",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 16.5,fontWeight: FontWeight.bold),)
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
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.70,
                    alignment: Alignment.center,
                    child:Text("Buy it Now",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 16.5,fontWeight: FontWeight.bold),)
                ),
              ),
              Container(
                height: 2,
                margin: const EdgeInsets.only(bottom: 12),
                decoration:  BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade400,width: 3))
                ),
              ),
              Text("Recommended Products :",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.w700,
                  fontSize: 16.6),),
              recommended.isEmpty?const CircularProgressIndicator(color: Colors.blue,):Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                height: 240,
                child:ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommended.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16.0); // Replace this with the desired separator width.
                  },
                  itemBuilder: (context, index) {
                    return ProductWidget(productId: recommended[index].id);
                  },
                )

              )
            ],
          ),
        ),
      ),
    );
  }

  void getProduct(String productId) async{ 
    http.Response res=await http.get(Uri.parse("${uri}api/product/$productId"));
    httpErrorHandle(res: res, context: context, onSuccess: () {
      productModel=ProductModel.fromJson(jsonDecode(res.body)['product']);
      setState(() {});
    },);
    if(productModel!=null){
      getRecommended(productModel!.productType);
    }
  }

  Future<List<ProductModel>> getRecommended(List<String> productType) async{
    List<ProductModel>list=[];
    print(productType);
    Map<String, dynamic> jsonMap = {'productType': productType};
    String jsonBody = json.encode(jsonMap); // Convert the JSON object to a string
    http.Response  res = await http.post(
      Uri.parse("${uri}api/product/similar-products/"),
      headers: {'Content-Type': 'application/json'}, // Set the content type
      body: jsonBody, // Send the JSON string as the body
    );

    if(context.mounted){
      httpErrorHandle(res: res, context: context, onSuccess: () async {
        // print(json.decode(res.body)['products']);
        List<dynamic> data = await json.decode(res.body)['products'];
        for (var e in data) {
          String d=jsonEncode(e);
          recommended.add(ProductModel.fromJson(e));
        }
       // print(recommended.length);
        setState(() {});
      },);
    }
    return list;
  }
}

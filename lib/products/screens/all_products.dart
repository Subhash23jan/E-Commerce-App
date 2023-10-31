import 'dart:convert';

import 'package:amazon_clone_flutter/products/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../constants/error_handling.dart';
import '../../constants/global_variables.dart';
import '../../models/product_model.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key, required this.productType});
  final List<String>productType;

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final searchController=TextEditingController();
  List<List<ProductModel>>  productsList=[[]];
  bool isLoaded=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getAllProducts(context,widget.productType);
  }
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
                          hintStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 14)
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      body:Container(
        margin: const EdgeInsets.only(left: 10,right: 5,top: 5),
        height:widget.productType.length*250,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (200*widget.productType.length+40).toDouble(),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.productType.length,
                  itemBuilder: (context, index1){
                    Future<List<ProductModel>> list;
                    list=getRecommended([widget.productType[index1]]);
                  return Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    decoration:  BoxDecoration(
                        color: Colors.grey.shade100,
                        border:const Border(bottom: BorderSide(color: Colors.black,width: 1))
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tags : ${widget.productType[index1]}",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 17),),
                         SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            child: FutureBuilder(
                              future:list, builder:(context, snapshot) {
                                return  snapshot.hasData?SizedBox(
                                  height: 290,
                                  width: snapshot.data!.length.toDouble()*180,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:snapshot.data?.length,
                                    itemBuilder: (context, index2) {
                                      return ProductWidget(productId:snapshot.data![index2].id,);
                                    },
                                  ),
                                ):const Center(child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: Colors.grey,),);
                            },),
                          )
                        ),
                      ],
                    ),
                  );
                },),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getAllProducts(BuildContext context, List<String> productType) {
    for(int i=0;i<productType.length;i++){
    //  getRecommended([productType[i]],i);
    }
    setState(() {
      isLoaded=true;
    });
  }
  Future<List<ProductModel>>  getRecommended(List<String> productType) async{
    List<ProductModel>list=[];
    Map<String, dynamic> jsonMap = {'productType': productType};
    String jsonBody = json.encode(jsonMap); // Convert the JSON object to a string
    http.Response  res = await http.post(
      Uri.parse("${uri}api/product/similar-products"),
      headers: {'Content-Type': 'application/json'}, // Set the content type
      body: jsonBody, // Send the JSON string as the body
    );
  //  print(res.body.toString());
    if(context.mounted){
      httpErrorHandle(res: res, context: context, onSuccess: () async {
        // print(json.decode(res.body)['products']);
        List<dynamic> data =  json.decode(res.body)['products'];
       // print(json.decode(res.body)['products']);
        for (var e in data) {
          ProductModel productModel=ProductModel.fromJson(e);
          list.add(productModel);
                  setState(() {});
           }},
      );
    }
    return list;
   // print(productsList?[index].length);
  }
}

import 'dart:convert';

import 'package:amazon_clone_flutter/models/order_model.dart';
import 'package:amazon_clone_flutter/models/order_product.dart';
import 'package:amazon_clone_flutter/pages/order_history.dart';
import 'package:amazon_clone_flutter/products/product_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/error_handling.dart';
import '../constants/global_variables.dart';
import '../models/product_model.dart';
class ShowOrderDetails extends StatefulWidget {
  const ShowOrderDetails({super.key, required this.order});
  final Order order;
  @override
  State<ShowOrderDetails> createState() => _ShowOrderDetailsState();
}

class _ShowOrderDetailsState extends State<ShowOrderDetails> {
  List<ProductModel>products=[];
  int totalProducts=0;
  double totalSum=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Your Order",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 19),),
        backgroundColor: GlobalVariables.secondaryColor,
      ),
      body:(products.isEmpty)?const Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,),)
          : Column(
            children: [
              ListView.builder(
        shrinkWrap: true,
        itemCount:widget.order.products.length,
        physics:const PageScrollPhysics(),
        itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey,width: 2) )
                ),
                height: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(products[index].url,
                          width: MediaQuery.sizeOf(context).width*0.4,height: 190,fit: BoxFit.fill,),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(productId: products[index].id),)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        Text(toBeginningOfSentenceCase(products[index].name)??products[index].name,style: GoogleFonts.aBeeZee(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.cyan),overflow: TextOverflow.ellipsis,maxLines: 2,),
                        RichText(
                          text: TextSpan(
                              children:[  TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                                  text: "Price : "
                              ),TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black),
                                  text: "₹${products[index].price.toString()}")]
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              children:[  TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                                  text: "Quantity : "
                              ),TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black),
                                  text: widget.order.products[index].quantity.toString()
                              )]
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              children:[  TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                                  text: "Total : "
                              ),TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black),
                                  text:(widget.order.products[index].quantity*widget.order.products[index].price).toString()
                              )]
                          ),
                        ),
                        const SizedBox(height: 5,),
                      ],
                    ),
                  ],
                ),
              );
        },),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Summary :",style: GoogleFonts.sansita(color: Colors.black,fontSize: 19),),
                    Text("Total products : $totalProducts",style: GoogleFonts.sansita(color: Colors.black,fontSize: 19),),
                    Text("Total Cost:₹$totalSum",style: GoogleFonts.sansita(color: Colors.black,fontSize: 19),)
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 50),
                  alignment: Alignment.center,
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 8,
                        padding: const EdgeInsets.only(left: 5),
                        fixedSize: const Size(180, 45),
                        backgroundColor: Colors.yellowAccent.shade700
                    ),
                    child:Text("My orders",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                    onPressed: (){
                      Navigator.maybePop(context);
                    }
                  )
              ),
            ],
          ),
    );
  }

  Future<void> getProducts() async {
    for(int i=0;i<widget.order.products.length;i++){
      ProductModel?  model= await getProduct(widget.order.products[i].productId);
      if(model!=null) {
        products.add(model);
        totalSum+=(model.price)*widget.order.products[i].quantity;
        totalProducts+=widget.order.products[i].quantity;
        products.add(model);
      }
    }
    setState(() {});
  }
  Future<ProductModel?> getProduct(String id) async {
    ProductModel ? productModel;
    http.Response res = await http.get(Uri.parse('${uri}api/product/$id'));
    if (context.mounted) {
      //  print(res.body.toString());
      httpErrorHandle(res: res, context: context,
        onSuccess: () {
          productModel = ProductModel.fromJson(
              jsonDecode(res.body)['product']);
        },);
      return productModel;
    }
    return productModel;
  }
}

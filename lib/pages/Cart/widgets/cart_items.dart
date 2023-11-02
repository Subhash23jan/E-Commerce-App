
import 'dart:convert';

import 'package:amazon_clone_flutter/models/cartItem.dart';
import 'package:amazon_clone_flutter/models/product_model.dart';
import 'package:amazon_clone_flutter/products/screens/all_products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../products/product_page.dart';
Container cartProduct(  BuildContext context,ProductModel productModel,CartItem cartItem)
{
  return Container(
    height: 310,
    color: GlobalVariables.greyBackgroundColor.withOpacity(0.1),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 220,
              width: 200,
              child: Stack(
                children: [
                  Positioned(top: 28,left: 20,
                      child: SizedBox(
                          width: 160,height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(productId:productModel.id),));
                                  },
                                  child: Image.network(productModel.url,fit: BoxFit.fill,))))),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name,
                    style: GoogleFonts.aBeeZee(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2, // Increase the maxLines to the number of lines you want to display
                  ),
                  Text("",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize:10,fontStyle: FontStyle.italic),),
                  Text("₹${productModel.price}",style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.5),),
                  Text("eligible for free shipping!!",style: GoogleFonts.aBeeZee(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14.5),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  Text("in stock",style: GoogleFonts.aBeeZee(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 14.5),),
                  Text("10 days Replacement",style: GoogleFonts.aBeeZee(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 14.5),overflow: TextOverflow.ellipsis,maxLines: 1,),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2.3),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      http.Response res=await http.put(
                        Uri.parse('${uri}api/user/remove-cart'),
                        headers: {'Content-Type': 'application/json'},
                        body:jsonEncode(CartItem(1, cartItem.productId,cartItem.email)),
                      );
                      if(context.mounted){
                        httpErrorHandle(res: res, context: context, onSuccess: () {
                          showSnackBar(jsonDecode(res.body)['msg'], context);
                        },);
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration:   const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))
                      ),
                      child: const Icon(Icons.remove_rounded,color: Colors.black87,size: 18,),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 30,
                    alignment: Alignment.center,
                    decoration:   const BoxDecoration(
                      color: Colors.white,

                    ),
                    child:  Text("${cartItem.quantity}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  ),
                  InkWell(
                    onTap: () async {
                      http.Response res=await http.put(
                        Uri.parse('${uri}api/user/add-cart'),
                        headers: {'Content-Type': 'application/json'},
                        body:jsonEncode(CartItem(1, cartItem.productId,cartItem.email)),
                      );
                      if(context.mounted){
                        httpErrorHandle(res: res, context: context, onSuccess: () {
                          showSnackBar(jsonDecode(res.body)['msg'], context);
                        },);
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration:const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                      ),
                      child: const Icon(Icons.add,color: Colors.black87,size: 18,),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    http.Response res=await http.put(
                      Uri.parse('${uri}api/user/remove-cart'),
                      headers: {'Content-Type': 'application/json'},
                      body:jsonEncode(cartItem),
                    );
                    if(context.mounted){
                      httpErrorHandle(res: res, context: context, onSuccess: () {
                        showSnackBar(jsonDecode(res.body)['msg'], context);
                      },);
                    }
                  },
                  child: Container(
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration:    BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 1.5,
                          spreadRadius: 0.1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Text("Delete",style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.w700),),
                  ),
                ),
                const SizedBox(width: 5,),
                Container(
                  width: 110,
                  height: 30,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 1.5,
                        spreadRadius: 0.1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child:  Center(child: Text("Save for later",style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.w700),)),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllProducts(productType:productModel.productType),)),
          child: Container(
            margin: const EdgeInsets.only(top: 18,left: 13.5),
            width: 160,
            height: 33,
            decoration:BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1.8),
                  blurRadius: 1.5,
                  spreadRadius: 0.1,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Center(child: Text("See more like this",style: GoogleFonts.openSans(fontSize: 14.5,fontWeight: FontWeight.w700),)),
          ),
        ),
      ],
    ),
  );
}

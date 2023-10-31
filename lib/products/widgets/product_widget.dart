import 'dart:convert';
import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/models/product_model.dart';
import 'package:amazon_clone_flutter/products/product_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.productId});
  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  ProductModel ? productModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct(widget.productId,context);
  }
  @override
  Widget build(BuildContext context) {
    return productModel==null?const Center(child: SizedBox()):Container(
      width: 170,
      height: 240,
      margin: const EdgeInsets.only(right: 6,left: 2,top: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
      ),
      padding: const EdgeInsets.only(top: 2),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
      builder: (context) => ProductPage(productId:productModel!.id),)),
            child: Image.network(
              productModel!.url,
              fit: BoxFit.fill,
              width: 165,height: 185,),
          ),
          Text(productModel!.name,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600,color: Colors.blue.shade700,fontSize: 15,),overflow: TextOverflow.ellipsis,maxLines: 1,),
          Text("₹${productModel!.price}",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15),),

        ],
      ),
    );
  }

  Future<void> getProduct(String id,BuildContext context) async {
    http.Response res = await http.get(Uri.parse('${uri}api/product/$id'));
    if(context.mounted){
    //  print(res.body.toString());
      httpErrorHandle(res: res, context: context,
        onSuccess:() {
          productModel=ProductModel.fromJson(jsonDecode(res.body)['product']);
          setState(() {});
        },);
    }

  }
}

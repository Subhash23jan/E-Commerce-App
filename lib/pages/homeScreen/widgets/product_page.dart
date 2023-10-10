import 'dart:convert';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductModel? product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDetails(context);
  }
  void getProductDetails(BuildContext context) async{
    http.Response res = await http.post(
      Uri.parse('$uri/api/user/signup'),
      body: jsonEncode({
            'id': widget.productId
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(context.mounted){
      httpErrorHandle(res: res, context: context, onSuccess: () {
        product=ProductModel.fromJson(json.decode(res.body));
      },);
    }
  }
  @override
  Widget build(BuildContext context) {
    return product!=null?const Scaffold(
    ):const Center(child: CircularProgressIndicator(),);
  }
}

import 'dart:convert';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:amazon_clone_flutter/pages/order_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../constants/global_variables.dart';
import '../models/cartItem.dart';
import '../models/order_product.dart';
import '../models/product_model.dart';
import '../provider/user_provider.dart';

class OrderCheckOut extends StatefulWidget {
  const OrderCheckOut({super.key, required this.cartItems, required this.products});
  final List<CartItem>cartItems;
  final List<ProductModel>products;

  @override
  State<OrderCheckOut> createState() => _OrderCheckOutState();
}

class _OrderCheckOutState extends State<OrderCheckOut> {
  double totalSum=0;
  UserModel ? _user;
  bool orderPlaced=false;
  bool isOrderPlacing=false;
  int totalProducts=0;
  List<dynamic>productList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalAndSum();
  }
  @override
  Widget build(BuildContext context) {
    _user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(
        title: Text("order-checkout",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),),
        // centerTitle: true,
        backgroundColor:Colors.black,
      ),
      body: isOrderPlacing?Container(
        alignment: Alignment.center,
        child:  Stack(
          alignment: Alignment.center,
          children: [
            const CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.blue,
            ),
            Text("please wait...Order is Placing",style: GoogleFonts.aboreto(fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,maxLines: 1,),
          ],
        ),
      ):orderPlaced?Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child:  ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 18,
                padding: const EdgeInsets.only(left: 5),
                fixedSize: const Size(180, 45),
                backgroundColor: Colors.redAccent
            ),
            child:Text("View My orders",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
            onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyOrders(user:UserModel(id: _user!.id, name: _user!.name, email: _user!.email, password: _user!.password, address: _user!.address, userType: _user!.userType)),));
            }
          )
      ):SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount:widget.cartItems.length,
              physics: const ScrollPhysics(),
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
                    const SizedBox(
                      width: 20,
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      child: Image.network(widget.products[index].url,
                      width: MediaQuery.sizeOf(context).width*0.4,height: 190,fit: BoxFit.fill,),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5,),
                          Text(toBeginningOfSentenceCase(widget.products[index].name)??widget.products[index].name,style: GoogleFonts.aBeeZee(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.cyan),overflow: TextOverflow.ellipsis,maxLines: 1,),
                          Text("price:₹${widget.products[index].price}",style: GoogleFonts.aBeeZee(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                          Text("quantity:${widget.cartItems[index].quantity}",style: GoogleFonts.aBeeZee(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                          Text("total:₹${widget.cartItems[index].quantity*widget.products[index].price}",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,maxLines: 1,),
                          const SizedBox(height: 5,),
                        ],
                      ),
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
                  child:Text("checkout-order",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                  onPressed: () async {
                    setState(() {isOrderPlacing=true;});
                    http.Response response=await http.post(
                      Uri.parse('${uri}api/user/order-checkout'),
                        headers: {
                        'Content-Type': 'application/json',
                          'email':_user!.email,
                        },
                      body:jsonEncode({"products": productList}),
                    );
                    if(context.mounted){
                      httpErrorHandle(res: response, context: context, onSuccess: () {
                        deleteCartItems(jsonDecode(response.body)['msg']);
                      },);
                    }
                  },
                )
            ),
          ],
        ),
      ),
    );
  }

  void getTotalAndSum() {
    for(int i=0;i<widget.products.length;i++){
      totalSum+=widget.products[i].price*widget.cartItems[i].quantity;
      totalProducts+=widget.cartItems[i].quantity;
      productList.add(OrderProduct(productId:widget.products[i].id,quantity: widget.cartItems[i].quantity, price:(widget.products[i].price).toInt()));
    }
    setState(() {});
  }

  void deleteCartItems(String message) async{
    for(int i=0;i<widget.products.length;i++){
      http.Response res=await http.put(
        Uri.parse('${uri}api/user/remove-cart'),
        headers: {'Content-Type': 'application/json'},
        body:jsonEncode(widget.cartItems[i]),
      );
    }
    if(context.mounted){
      showSnackBar(message, context);
      orderPlaced=true;
      isOrderPlacing=false;
    }
    setState(() {});
  }
}

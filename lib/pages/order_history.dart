import 'dart:convert';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/models/order_product.dart';
import 'package:amazon_clone_flutter/pages/Cart/screens/cart_page.dart';
import 'package:amazon_clone_flutter/pages/specific_order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/global_variables.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';
import '../provider/user_provider.dart';
import 'favourites_page.dart';
class MyOrders extends StatefulWidget {
  const MyOrders({super.key, required this.user});
  final UserModel user;

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final searchController=TextEditingController();
  List<String>orderList=[];
  bool isLoading=true;
  List<Order>orders=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrdersList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text("Your Orders",style: GoogleFonts.aBeeZee(color: Colors.white),),
        // centerTitle: true,
        backgroundColor:GlobalVariables.secondaryColor,
      ),
      body:(isLoading)?const Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,),):
      (orders.isEmpty && orders.length==orderList.length)?Container(
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child:  Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No order placed from you!!!",style: GoogleFonts.aBeeZee(),),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 18,
                      padding: const EdgeInsets.only(left: 5),
                      fixedSize: const Size(220, 45),
                      //  backgroundColor: Colors.redAccent
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const CartPage(),), (route) => false);
                    }, icon: const Icon(CupertinoIcons.cart,color: Colors.redAccent,size: 24,),
                    label:  Text("Go to Cart",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 19),)),
              ],
            ),
          )):ListView.builder(
        itemCount: orders.length,
        shrinkWrap: true,
        itemBuilder:(context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
            height: 100,
            child: ElevatedButton.icon(

              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(),
                elevation: 8,
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                shadowColor: Colors.white,
                side:  BorderSide(width: 1,style: BorderStyle.solid)
              ),

              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowOrderDetails(order:orders[index]),));
              },
              icon: const Icon(Icons.border_bottom_sharp),
              label: Row(
                children: [
                  const SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          children:[  TextSpan(
                            style: GoogleFonts.aBeeZee(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 14),
                            text: "Order-Id : "
                          ),TextSpan(
                              style: GoogleFonts.aBeeZee(color:Colors.black,),
                              text: orders[index].orderId
                          )]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            children:[  TextSpan(
                                style: GoogleFonts.aBeeZee(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 14),
                                text: "Date : "
                            ),
                              TextSpan(
                                style: GoogleFonts.aBeeZee(color:Colors.black,),
                                text: DateFormat('EEEE , dd MMMM ').format(orders[index].date)
                            ),
                              TextSpan(
                                  style: GoogleFonts.aBeeZee(color: Colors.black),
                                  text: DateFormat('h:mm a').format(orders[index].date)
                              )
                            ]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            children:[  TextSpan(
                                style: GoogleFonts.aBeeZee(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 14),
                                text: "Number Of Products : "
                            ),TextSpan(
                                style: GoogleFonts.aBeeZee(color:Colors.black,),
                                text: orders[index].products.length.toString()
                            )]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },),
    );
  }

  Future<void> getOrdersList() async {
        print(widget.user.email);
        http.Response res=await http.get(
          Uri.parse('${uri}api/user/orders'),
          headers: {
            'Content-Type': 'application/json',
            'email':widget.user.email??""
          },
        );
        if(context.mounted){
          httpErrorHandle(res: res, context: context, onSuccess: () async {
            List<dynamic>list=jsonDecode(res.body)['orders'];
            for(var item in list){
              orderList.add(item['orderId']);
              print(item['orderId']);
              await getOrdersDetails(item['orderId']);
            }
          },);
          isLoading=false;
          print(orders.length);
          setState(() {});
        }
  }
  Future<void>getOrdersDetails(String orderId)async{
    http.Response res=await http.get(
      Uri.parse('${uri}api/user/order/$orderId'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if(context.mounted){
      httpErrorHandle(res: res, context: context, onSuccess: () {
        Map<String,dynamic> item=jsonDecode(res.body)['order'];
        List<OrderProduct>list=[];
        for(var data in item['products']){
          list.add(OrderProduct(productId:data['productId'], price: data['price'],quantity: data['quantity']));
        }
        print(DateTime.parse(item['date']));
        orders.add(Order(products:list, date:DateTime.parse(item['date'].toString()), orderId:orderId));
      },);
      isLoading=false;
      setState(() {});
    }
    
  }
}

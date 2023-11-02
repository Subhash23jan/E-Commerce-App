import 'package:amazon_clone_flutter/models/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/global_variables.dart';
class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final searchController=TextEditingController();
  List<String>orderList=[];
  List<Order>orders=[];
  @override
  Widget build(BuildContext context) {
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
                    decoration:   InputDecoration(
                        border: InputBorder.none,
                        suffixIcon:const SizedBox(
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
                        hintText: "Search in your orders",
                        hintStyle: GoogleFonts.aBeeZee(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 15)
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
      body:ListView.builder(
        itemBuilder:(context, index) {
        return Container();
      },),
    );
  }
}

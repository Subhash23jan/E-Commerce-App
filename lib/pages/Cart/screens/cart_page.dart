// ignore: file_names
import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:amazon_clone_flutter/pages/Cart/widgets/cart_items.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/widgets/addressBox.dart';
import 'package:amazon_clone_flutter/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late  UserModel _user;
  @override
  Widget build(BuildContext context) {
    _user=Provider.of<UserProvider>(context,listen: false).user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 2),
                      child: Image.asset("assets/images/amazon_in.png",height: 45),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 22),
                          child: Icon(Icons.notifications_none,color: Colors.black,size:35,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.search,color: Colors.black,size: 35,),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             addressBox(),
             Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 8),
              child: Text("Sub total ₹1000",style: GoogleFonts.aBeeZee(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            InkWell(
              onTap: (){},
              child: Align(
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
                    child:Text("Proceed to Buy (1 item)",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 15,bottom: 8),
              child: Text("Deselect all items",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.blue.shade700,fontSize: 19),),
            ),
             cartItem()
          ],
        ),
      ),
    );
  }
}

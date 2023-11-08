import 'dart:convert';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/flutter_classes/rate_classes.dart';
import 'package:amazon_clone_flutter/flutter_classes/size_classes.dart';
import 'package:amazon_clone_flutter/models/cartItem.dart';
import 'package:amazon_clone_flutter/models/product_model.dart';
import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:amazon_clone_flutter/pages/Cart/screens/cart_page.dart';
import 'package:amazon_clone_flutter/pages/order_checkout.dart';
import 'package:amazon_clone_flutter/provider/user_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/global_variables.dart';
import '../models/favourites_model.dart';
import 'widgets/product_widget.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];
  String? selectedValue;
  UserModel ? _user;
  String formattedDate = DateFormat('EEEE , dd MMMM').format(DateTime.now());
  final searchController=TextEditingController();
  int ?sizeSelected;
  ProductModel ? productModel;
  int quantity=1;
  List<ProductModel>  recommended=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct(widget.productId);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _user=Provider.of<UserProvider>(context).user;
    selectedValue=quantity.toString();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
        icon: const Icon(CupertinoIcons.cart,color: Colors.yellowAccent,size: 20,),
        backgroundColor: Colors.black87,
        elevation: 28,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CartPage();
          },));
      }, label:Container(
        alignment: Alignment.center,
          width: 88,
          child: Text("Way to Cart",style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.cyan,fontWeight:FontWeight.bold,),)), ),
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
                   Positioned(
                      right:8.1,
                      top: 1,
                      child: InkWell(
                        onTap: (){
                          showSnackBar("work madbeku wait madro pls!!🥲", context);
                        },
                          child: const Icon(CupertinoIcons.share,size: 26,color: Colors.black,))),

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectItemCount(context),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                       fixedSize: const Size(110, 45),
                        backgroundColor: Colors.redAccent),
                      onPressed: () async {
                          http.Response response= await http.put(
                              Uri.parse('${uri}api/user/add-favourite'),
                              headers: {'Content-Type': 'application/json'},
                              body: jsonEncode(Favourites(_user?.email,widget.productId))
                          );
                          if(context.mounted){
                            httpErrorHandle(res: response, context: context, onSuccess: () async {
                              showSnackBar(jsonDecode(response.body)['msg'], context);
                            },);
                          }
                  }, icon: const Icon(CupertinoIcons.bag,color: Colors.yellowAccent,size: 18,), label:  Text(" Add to Wishlist",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15,bottom: 5),
                alignment: Alignment.center,
                child:  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                        padding: const EdgeInsets.only(left: 5),
                        fixedSize: const Size(180, 45),
                      //  backgroundColor: Colors.redAccent
                    ),
                    onPressed: () async {
                      CartItem item=CartItem(quantity,widget.productId,_user!.email);
                      if (kDebugMode) {
                        print(_user!.email);
                      }
                      http.Response res=await http.put(
                        Uri.parse('${uri}api/user/add-cart'),
                        headers: {'Content-Type': 'application/json'},
                        body:jsonEncode(item),
                      );
                      if(context.mounted){
                        httpErrorHandle(res: res, context: context, onSuccess: () {
                          quantity=1;
                          showSnackBar(jsonDecode(res.body)['msg'], context);
                          setState(() {});
                        },);
                      }
                    }, icon: const Icon(CupertinoIcons.cart,color: Colors.redAccent,size: 22,), label:  Text(" Add to Cart",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
              ),
              Container(
                  margin: const EdgeInsets.only(top:5,bottom: 15),
                  alignment: Alignment.center,
                  child:  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                          padding: const EdgeInsets.only(left: 5),
                          fixedSize: const Size(180, 45),
                          backgroundColor: Colors.yellowAccent.shade700),
                      onPressed: () async {
                        if(productModel!=null){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrderCheckOut(cartItems:[CartItem(quantity,widget.productId,_user!.email)],
                                products:[ProductModel(id: productModel!.id, name: productModel!.name, url: productModel!.url, productType:productModel!.productType
                                    , price: productModel!.price)] ),));
                        }
                      }, icon: const Icon(Icons.money,color: Colors.black,size: 22,), label:  Text(" Buy it Now",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
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
                width:((170*recommended.length)+10).toDouble(),
                child:ListView.separated(
                  shrinkWrap:false,
                  physics:  const ScrollPhysics(),
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
    if(context.mounted){
      httpErrorHandle(res: res, context: context, onSuccess: () {
        productModel=ProductModel.fromJson(jsonDecode(res.body)['product']);
        setState(() {});
      },);
    }
    if(productModel!=null){
      getRecommended(productModel!.productType);
    }
  }

  Future<List<ProductModel>> getRecommended(List<String> productType) async{
    List<ProductModel>list=[];
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
          recommended.add(ProductModel.fromJson(e));
        }
       // print(recommended.length);
        setState(() {});
      },);
    }
    return list;
  }
  DropdownButtonHideUnderline selectItemCount(BuildContext context){
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(

        hint: const Text("1"),

        items: items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            quantity=int.parse(selectedValue!);
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 45,
          width: 95,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.redAccent,
          ),
          elevation: 8,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            CupertinoIcons.sort_down_circle_fill
          ),
          iconSize: 18,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          useSafeArea: true,
          width: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.redAccent,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

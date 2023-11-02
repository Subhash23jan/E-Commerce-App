import 'dart:convert';

import 'package:amazon_clone_flutter/models/favourites_model.dart';
import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:amazon_clone_flutter/products/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants/error_handling.dart';
import '../constants/global_variables.dart';
import '../models/product_model.dart';
import '../provider/user_provider.dart';
import 'Cart/screens/cart_page.dart';
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final searchController=TextEditingController();
  UserModel ? _user;
  bool isLoading=true;
  List<ProductModel>favouriteList=[];
  List<Favourites>favourites=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _user = Provider.of<UserProvider>(context, listen: false).user;
    getFavourites(context);
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
                        hintText: "Search in your list",
                        hintStyle: GoogleFonts.aBeeZee(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 15)
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
          icon: const Icon(CupertinoIcons.cart,color: Colors.yellowAccent,size: 20,),
          backgroundColor: Colors.redAccent,
          elevation: 28,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const CartPage();
            },));
          }, label:Container(
            alignment: Alignment.center,
            width: 88,
            child: Text("Go to Cart",style: GoogleFonts.aBeeZee(fontSize: 16,color: Colors.white),)), ),
      body:(isLoading || (favouriteList.length!=favourites.length))?const Center(child: CircularProgressIndicator(color: Colors.grey,strokeWidth: 1.5,)):Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          itemCount: favouriteList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.indigo.shade700,width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ProductPage(productId:favouriteList[index].id),)),
                        child: Image.network(
                          favouriteList[index].url,
                          fit: BoxFit.cover,
                          height: 120,
                          width: 155,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                favouriteList[index].name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style:  GoogleFonts.alatsi(fontSize: 17,color: Colors.cyan.shade700,),
                              ),
                            ),
                            Text(
                              "₹${favouriteList[index].price}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.alatsi(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const Icon(CupertinoIcons.delete, color: Colors.redAccent, size: 24),
                      const SizedBox(width: 6,)
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      )
    );
  }
  getFavourites(BuildContext context) async {
    print(_user?.email);
    http.Response response = await http.get(
      Uri.parse(('${uri}api/user/favourites')),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'email': _user!.email
      },
    );
    if (context.mounted) {
      httpErrorHandle(res: response, context: context, onSuccess: () async {
        List<Favourites>items = [];
        List<ProductModel>productList=[];
        if(jsonDecode(response.body)['favourites']!=null){
          List<dynamic>list = jsonDecode(response.body)['favourites'];
          for (dynamic item in list) {
            items.add(Favourites(_user?.email,item['productId']));
            ProductModel?  model= await getProduct(item['productId'], context);
            if(model!=null) {
              productList.add(model);
            }
          }
        }
        setState(() {
          favourites=items;
          favouriteList=productList;
          isLoading=false;
        //  print(favouriteList.length);
        });
        //  print(products.length);
      },);
    }
  }
  Future<ProductModel?> getProduct(String id, BuildContext context) async {
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

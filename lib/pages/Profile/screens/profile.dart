import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/pages/order_history.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../constants/utils.dart';
import '../../../models/user_model.dart';
import '../../../provider/user_provider.dart';
import '../../favourites_page.dart';
import '../widgets/buy_again.dart';
import '../widgets/options.dart';
import '../widgets/orders.dart';
import '../widgets/your_account.dart';
import '../widgets/your_lists.dart';

class ProfileOptions{
  final BuildContext context;
  final UserModel _user;

  ProfileOptions(this.context,this._user);

  Widget options(){
    return Container(
      padding: const EdgeInsets.only(top: 12),
      color: GlobalVariables.backgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                if (kDebugMode) {
                  print('clicked');
                }
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MyOrders(user: _user),));
              },style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Your Orders",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Buy Again",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),          ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Your Account",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavouritesPage(),));
              },style: ElevatedButton.styleFrom(
                  elevation: 5,backgroundColor:Colors.white70,
                  fixedSize: const Size(150, 45),
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
              ), child:Text("Your Wishlist",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15),),),          ],
          ),
        ],
      ),
    );
  }
}
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
   UserModel ? _user;
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {

    });
  }
  @override
  Widget build(BuildContext context) {
    _user=Provider.of<UserProvider>(context,listen: false).user;
    print(_user!.email);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
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
                      child: Image.asset("assets/images/amazon_in.png",height: 35),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 22),
                          child: Icon(Icons.notifications_none,color: Colors.black,size:28,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.search,color: Colors.black,size: 28,),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
      body: Container(
        margin: const EdgeInsets.only(left: 15,right: 8),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 8,bottom: 5),
                child: RichText(
                    text:  TextSpan(
                  children: [
                    TextSpan(text: "Hello  ",style:const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text:toBeginningOfSentenceCase("${_user?.email}"),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                      ]
                    )
                  ]
                )),
              ),
              ProfileOptions(context,_user!).options(),
              const YourOrders(),
              const YourLists(),
              const YourAccount(),
              const BuyAgain()
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        elevation: 16,
        onPressed: (){
          showSnackBar("sorry!! It is not real amazon app..🙅", context);
        },child: Image.network("https://cdn.icon-icons.com/icons2/2108/PNG/512/amazon_alexa_icon_130998.png"), ),
    );
  }
}

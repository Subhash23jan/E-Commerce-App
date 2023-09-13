import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../provider/user_provider.dart';
import '../widgets/buy_again.dart';
import '../widgets/options.dart';
import '../widgets/orders.dart';
import '../widgets/your_account.dart';
import '../widgets/your_lists.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
   late final UserModel _user;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user=Provider.of<UserProvider>(context).user;
  }
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: const EdgeInsets.only(left: 15,right: 8),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 8,bottom: 5),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(text: "Hello  ",style:const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: _user.name,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,))
                      ]
                    )
                  ]
                )),
              ),
              const Options(),
              const YourOrders(),
              const YourLists(),
              const YourAccount(),
              const BuyAgain()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 35,
        backgroundColor: Colors.white,
        onPressed: () {  },
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network("https://beebom.com/wp-content/uploads/2018/01/alexa-featured_750px.png?w=750&quality=75",
            width:100,height: 80,fit:BoxFit.fill,),
        ),
      ),
    );
  }
}

import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/utils.dart';
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
  late UserModel ? _user;
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _user=Provider.of<UserProvider>(context,listen: false).user;
    });
  }
  @override
  Widget build(BuildContext context) {

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
                    text: const TextSpan(
                  children: [
                    TextSpan(text: "Hello  ",style:TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text:"Subhash",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic))
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
      floatingActionButton:FloatingActionButton(
        elevation: 16,
        onPressed: (){
          showSnackBar("sorry!! It is not real amazon app..🙅", context);
        },child: Image.network("https://cdn.icon-icons.com/icons2/2108/PNG/512/amazon_alexa_icon_130998.png"), ),
    );
  }
}


import 'dart:async';
import 'dart:convert';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:amazon_clone_flutter/products/screens/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Screens/AuthPages/sign_in.dart';
import '../../../constants/global_variables.dart';
import '../../../main.dart';
import '../../../provider/user_provider.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  UserModel ? _user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () {
      userVerification( context);
    });
  }
  void userVerification(BuildContext context)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email=prefs.getString("email");
    String? password=prefs.getString("password");
    if(email==null || password==null){
      if(context.mounted){
       // showSnackBar("please login to continue", context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignInPage(),));
      }
    }else{
      http.Response response = await http.post(
        Uri.parse('${uri}api/user/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if(context.mounted){
        httpErrorHandle(res: response, context: context, onSuccess: () {
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const MainPage()));
        },);
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    _user=Provider.of<UserProvider>(context,listen: true).user;
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.grey,
          strokeWidth: 1,
          // strokeWidth: ,
        ),
      ),
    );
  }
}

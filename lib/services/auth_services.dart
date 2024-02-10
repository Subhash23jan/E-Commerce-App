// ignore_for_file: use_build_context_synchronously
import 'package:amazon_clone_flutter/main.dart';
import 'package:amazon_clone_flutter/provider/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:amazon_clone_flutter/Screens/AuthPages/sign_in.dart';
import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    // ignore: duplicate_ignore
    print('stage2');
    try {
      UserModel user = UserModel(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '', userType: 'user',
          );
        http.Response res = await http.post(
        Uri.parse('${uri}api/user/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          context: context,
          res: res,
          onSuccess: () async {
            showSnackBar(
                'Account created successfully Now you can login ', context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ));
          });
    } catch (e) {
      showSnackBar(e.toString(), context);
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print('stage2');
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
      print(response.toString());
      httpErrorHandle(
          res: response,
          context: context,
          onSuccess: () async {
            print("stage 4");
            showSnackBar('login successfully', context);
            await prefs.setString("email", email);
            await prefs.setString("password", password);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const MainPage(),
            ));
          });
    } catch (e) {
      print("stage 5");
      print(e.toString());
      showSnackBar(e.toString(), context);
    }
  }

  // Future<UserModel> getUserData({
  //   required context,
  //   required email,
  // }) async {
  //   return UserModel(
  //       id: id,
  //       name: name,
  //       email: email,
  //       password: password,
  //       address: address,
  //       type: type);
  // }
}

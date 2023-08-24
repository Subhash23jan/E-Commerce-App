import 'package:amazon_clone_flutter/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier{
  UserModel _user = UserModel(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
  );
  UserModel get user=>_user;
  void setUser(String user)
   {
      _user=UserModel.fromJson(user);
      notifyListeners();
  }

}
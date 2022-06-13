import 'package:news_app/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Storage/SharedPreferencesManager.dart';


class AppProvider with ChangeNotifier{
  List<User> users=[];
  bool login=false;

  Future<bool> addUser(User _user) async {
    bool st=false;
    if(users.contains(_user)){
      st=false;
    }else {
      st=true;
      users.add(_user);
      SharedPreferencesManager().saveUser();
    }
    notifyListeners();
    return st;
  }

  void setLogin(bool _status){
    login=_status;
    notifyListeners();
  }
}
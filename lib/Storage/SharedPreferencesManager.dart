import 'package:news_app/Utils/Constant.dart';
import 'package:news_app/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager{
  late SharedPreferences pref;

  Future<SharedPreferences> init() async{
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return _prefs;
  }
  
  Future<void> saveUser(

      )async {

    //
    // User newUser=User(name: name, email: email, password: password);
    //
    // pref=await init();
    //
    // pref.setStringList(Constant().user, value)
    
}
  
}
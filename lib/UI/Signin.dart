import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Model/User.dart';
import 'package:news_app/Providers/AppProvider.dart';
import 'package:news_app/UI/Dashboard.dart';
import 'package:news_app/UI/Signup.dart';
import 'package:news_app/Utils/AppScaffoldMessenger.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.earlybirds,
                  size: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: const Text("Email"),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .apply(color: Colors.grey[500]),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 0.30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 0.30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 0.30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 0.30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 0.2,
                    ),
                  ),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                heroTag: null,
                elevation: 0,
                onPressed: () {
                  _checkLogin();
                },
                label: const Text(
                  'sign in',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.earlybirds,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?  ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Theme.of(context).cardColor,
                    heroTag: null,
                    elevation: 0,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const Signup()));
                    },
                    label: Text(
                      "Sign up",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.apply(color: Colors.redAccent, fontWeightDelta: 3),
                    ),
                    icon: const FaIcon(
                      FontAwesomeIcons.earlybirds,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _checkLogin() {

    List<User> _users = [];
    _users = Provider.of<AppProvider>(context, listen: false).users;
    if(_users.length>0) {
      for (User _user in _users) {
        Codec<String?, String> stringToBase64 = utf8.fuse(base64);
        String encodedPw = stringToBase64.encode(passwordController.text);


        if (_user.password == encodedPw &&
            _user.email == emailController.text) {
          Provider.of<AppProvider>(context, listen: false).setLogin(true);
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: const Dashboard()));
        } else {
          AppScaffoldMessenger().errorMsg(
              context, "Email or Password Incorrect");
        }
      }
    }else{
      AppScaffoldMessenger().errorMsg(
          context, "USER DETAILS NOT AVAILABLE");
    }
  }
}

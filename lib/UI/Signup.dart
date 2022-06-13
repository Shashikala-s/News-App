import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Model/User.dart';
import 'package:news_app/Providers/AppProvider.dart';
import 'package:news_app/UI/Signin.dart';
import 'package:news_app/Utils/AppScaffoldMessenger.dart';
import 'package:news_app/Utils/AppValidation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'Dashboard.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _validate = false;
  final nameController = TextEditingController();
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
            children: [
              Container(
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.earlybirds,
                  size: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                decoration: InputDecoration(
                  label: const Text("Name"),
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
                      color: Theme.of(context).disabledColor,
                      width: 0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                validator: (v) {
                  // print(v);

                  if (v!.isValidEmail) {
                    _validate = true;
                  } else {
                    _validate = false;
                    return 'Please enter a valid email';
                  }
                },
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  label: const Text("Email"),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .apply(color: Colors.grey[500]),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        BorderSide(color: Colors.redAccent, width: 0.30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                    const BorderSide(color: Colors.red, width: 0.30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).disabledColor,
                      width: 0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) {
                  // print(v);
                  if (v!.isValidPassword) {
                    _validate = true;
                  } else {
                    _validate = false;
                    return 'Please enter a valid Password';
                  }
                },
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
                      color: Theme.of(context).disabledColor,
                      width: 0.2,
                    ),
                  ),
                  label: Text('Password'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                heroTag: null,
                elevation: 0,
                onPressed: () {
                  _saveUser();
                },
                label: const Text(
                  'sign up',
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
                    "Already Have  account?  ",
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
                              child: const Signin()));
                    },
                    label: Text(
                      "Sign In",
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

  void _saveUser() async{
    try {
      if (_validate == false) {
        if (passwordController.text.isEmpty) {
          AppScaffoldMessenger().errorMsg(context, 'Password Empty..');
        } else if (nameController.text.isEmpty) {
          AppScaffoldMessenger().errorMsg(context, 'Name Empty..');
        } else if (emailController.text.isEmpty) {
          AppScaffoldMessenger().errorMsg(context, 'Email Empty..');
        }
      } else {
        AppScaffoldMessenger().loadingMsg(context, 'Loading..');
        Codec<String?, String> stringToBase64 = utf8.fuse(base64);
        String encodedPw = stringToBase64.encode(passwordController.text);
        User _user = User(
            name: nameController.text,
            email: emailController.text,
            password: encodedPw);

        //set provider
        bool status = await Provider.of<AppProvider>(context, listen: false)
            .addUser(_user);

        //navigate
        if (status) {
          Provider.of<AppProvider>(context, listen: false).setLogin(true);

          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: const Dashboard()));
        }else{
          AppScaffoldMessenger().errorMsg(context, 'Already Registered');
        }
      }
    } catch (e) {
      AppScaffoldMessenger().errorMsg(context, e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Signin.dart';
import 'package:page_transition/page_transition.dart';

import 'Dashboard.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: const Text("Name"),
                  labelStyle: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.grey[500]),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 1.0,
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: const Text("Email"),
                  labelStyle: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.grey[500]),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 1.0,
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Password',
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
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: const Dashboard()));
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
                    label:  Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.subtitle2?.apply(color: Colors.redAccent,fontWeightDelta: 3),
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
}

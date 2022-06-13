import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Providers/AppProvider.dart';
import 'package:news_app/UI/Dashboard.dart';
import 'package:news_app/UI/Signin.dart';
import 'package:news_app/UI/Signup.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    if(Provider.of<AppProvider>(context, listen: false).login){
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight,
              child: const Dashboard()));
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
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
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                child: Text('NEWS',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: Theme.of(context).primaryColor,
                    heroTag: null,
                    elevation: 0,
                    onPressed: () {

                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const Signup()));
                    },
                    label: const Text(
                      'sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const FaIcon(
                      FontAwesomeIcons.earlybirds,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.google,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
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

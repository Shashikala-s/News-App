import 'package:flutter/material.dart';
import 'package:news_app/Providers/AppProvider.dart';
import 'package:news_app/UI/Welcome.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AppOptionMenu {
  static const String logout = 'Logout';

  static const List<String> choices = <String>[logout];

  Future choiceSelection(String selected, BuildContext context) async {
    if (selected == 'Logout') {
      Provider.of<AppProvider>(context, listen: false).setLogin(false);

      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight,
              child: const Welcome()));
    }
  }

  final Color kBackgroung = Colors.blueGrey;
}

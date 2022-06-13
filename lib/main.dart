import 'package:flutter/material.dart';
import 'package:news_app/Providers/AppProvider.dart';
import 'package:news_app/UI/Dashboard.dart';
import 'package:news_app/UI/Signin.dart';
import 'package:news_app/UI/Welcome.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'Providers/ThemeProvider.dart';

void main() {
  runApp(const MyApp());
}
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
  ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
];
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>MultiProvider(
  providers: providers,
  builder: (context, _) {
  final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeProvider.themeMode,
      theme: MyTheme.lightTheme,
      title: 'News App',

      // home: Dashboard(),
      home: Welcome(),
    );
  }
  );
}


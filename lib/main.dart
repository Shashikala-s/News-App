import 'package:flutter/material.dart';
import 'package:news_app/Signin.dart';
import 'package:news_app/Welcome.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'Providers/ThemeProvider.dart';

void main() {
  runApp(const MyApp());
}
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
  // ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
  // ChangeNotifierProvider<ShoppingProvider>(create: (_) => ShoppingProvider()),
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

      home: Welcome(),
    );
  }
  );
}


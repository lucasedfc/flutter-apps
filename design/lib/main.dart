import 'package:design/src/pages/basic_page.dart';
import 'package:design/src/pages/buttons_page.dart';
import 'package:design/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /* SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white
      )
    ); */

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design',
      initialRoute: 'buttons',
      routes: {
        'basic': (BuildContext context) => BasicPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'buttons': (BuildContext context) => ButtonsPage()
      },
    );
  }
}
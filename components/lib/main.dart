import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';
// import 'package:components/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        print('Route called, ${ settings.name }');
        return MaterialPageRoute(builder: ( BuildContext context) => AlertPage());

      } ,

    );
  }
}
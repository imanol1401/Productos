
import 'package:flutter/material.dart';


import 'package:myapp/src/pages/home_page.dart';
import 'package:myapp/src/pages/producto_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'Material app',
        initialRoute: 'producto',
        routes:{
          /*'login':(BuildContext context) => LoginPage(),*/
          'home' :(BuildContext context) => HomePage(),
          'producto' :(BuildContext context) =>ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      );
  }
}
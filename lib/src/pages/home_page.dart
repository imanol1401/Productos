import 'package:flutter/material.dart';
/*import 'package:from_validation/src/bolc/provider.dart';*/
 
 
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),

        body: Container(),
        floatingActionButton: crearBoton(context),
        );

  }
  
  crearBoton(BuildContext context) {
    return FloatingActionButton(
    
    child:const Icon(Icons.add),

    backgroundColor: Colors.deepPurple,
    onPressed: ()=> Navigator.pushNamed(context, 'producto'),
  

    );
  }
}
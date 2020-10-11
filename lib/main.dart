import 'package:flutter/material.dart';
import 'home.dart';
import 'Bd/BdMaterias.dart';
void main() => runApp(Aplication());
class Aplication extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: "Navigation Drawer",
        home: Home(),
        theme: ThemeData(
          primaryColor: Colors.cyan,


        )
    );

  }
}


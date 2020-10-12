import 'package:flutter/material.dart';
import 'Bd/BdMaterias.dart';
import 'actividadesModelo.dart';
import 'materia.dart';
import 'actividades.dart';
class formMateria extends StatefulWidget{
  @override
  formMaterialState createState()=> formMaterialState();

}



class formMaterialState extends State<formMateria>{
  final scaffelkey= new GlobalKey<ScaffoldState>();
  final formKey=new GlobalKey<FormState>();
  final TextEditingController _nombreMateria = TextEditingController();
  final TextEditingController _nota1 = TextEditingController();
  final TextEditingController _nota2 = TextEditingController();
  final TextEditingController _nota3 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffelkey,
      appBar: AppBar(title: Text("Registro Materias"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese El Nombre De La Materia';
                    }
                    return null;
                  },
                  controller: _nombreMateria,
                  decoration: InputDecoration(
                    hintText: 'Nombre Materia',
                    labelText: "Materia",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota Primer Corte';
                    }
                    return null;
                  },
                  controller: _nota1,
                  decoration: InputDecoration(
                    hintText: 'Nota Primer Corte',
                    labelText: "Primer Corte",
                  ),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Actividades Corte 1"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => formActividades()),
                    );
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota Segundo Corte';
                    }
                    return null;
                  },
                  controller: _nota2,
                  decoration: InputDecoration(
                    hintText: 'Nota Segundo Corte',
                    labelText: "Segundo Corte",
                  ),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Actividades Corte 2"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => formActividades()),
                    );
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota Tercer Corte';
                    }
                    return null;
                  },
                  controller: _nota3,
                  decoration: InputDecoration(
                    hintText: 'Nota Tercer Corte',
                    labelText: "Tercer Corte",
                  ),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Actividades Corte 3"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => formActividades()),
                    );
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Registrar"),
                  onPressed: (){
                    final form= formKey.currentState;
                    if(form.validate()){
                      form.save();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'Bd/BdMaterias.dart';
import 'materia.dart';
import 'package:parcialmovilflutter/actividadesModelo.dart';
class formActividades extends StatefulWidget{
  @override
  formActividadesState createState()=> formActividadesState();

}
class formActividadesState extends State<formActividades>{
  final TextEditingController _idActividad = TextEditingController();
  final TextEditingController _nombreActividad = TextEditingController();
  final TextEditingController _nota = TextEditingController();
  final TextEditingController _porcentaje = TextEditingController();
  var mensaje;
  final scaffelkey= new GlobalKey<ScaffoldState>();
  final formKey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffelkey,
      appBar: AppBar(title: Text("Registro Actividades"),),
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
                      return 'Ingrese Codigo Actividad';
                    }
                    return null;
                  },
                  controller: _idActividad,
                  decoration: InputDecoration(
                    hintText: 'Codigo Actividad',
                    labelText: "Codigo",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {

                      return 'Ingrese El Nombre De La Actividad';
                    }
                    return null;
                  },
                  controller: _nombreActividad,
                  decoration: InputDecoration(
                    hintText: 'Nombre Actividad',
                    labelText: "Actividad",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese La Nota';
                    }else if((double.parse(value)<0.0)||(double.parse(value)>5)){
                      return 'Ingrese Una Nota Valida Entre 0 y 5';
                    }
                    return null;
                  },
                  controller: _nota,
                  decoration: InputDecoration(
                    hintText: 'Nota Actividad',
                    labelText: "Nota Actividad",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese El Porcentaje';
                    }else if((double.parse(value)<0)||(double.parse(value)>100)){
                      return 'Ingrese El Porcentaje Entre 0 y 100';
                    }
                    return null;
                  },
                  controller: _porcentaje,
                  decoration: InputDecoration(
                    hintText: 'Porcentaje Actividad',
                    labelText: "Porcentaje Actividad",
                  ),
                ),

                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Registrar"),
                  onPressed: (){
                    final form= formKey.currentState;
                    if(form.validate()){
                      form.save();
                      var activida = Actividades(_idActividad.text,_nombreActividad.text,_nota.text,
                      _porcentaje.text);
                      var dbHelper = DBHelper();
                      dbHelper.addItem(activida);
                      _showAlertDialog();
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
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Mensaje"),
            content: Text("Agregado Correctamente"),
            actions: <Widget>[
              RaisedButton(
                child: Text("CERRAR", style: TextStyle(color: Colors.white),),
                onPressed: (){ Navigator.of(context).pop(); },
              )
            ],
          );
        }
    );
  }

}
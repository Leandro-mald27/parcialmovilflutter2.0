import 'package:flutter/material.dart';
import 'package:parcialmovilflutter/actividadesModelo.dart';
import 'dart:async';
import 'Bd/BdMaterias.dart';

Future<List<Actividades>> fetchEmployeesFromDatabase() async {
  var dbHelper = DBHelper();
  var db = dbHelper.db;
  if(db!=null){
    Future<List<Actividades>> employees = dbHelper.getEmployees();
    return employees;
  }

}

class MyEmployeeList extends StatefulWidget {
  @override
  MyEmployeeListPageState createState() => new MyEmployeeListPageState();
}

class MyEmployeeListPageState extends State<MyEmployeeList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Consultar'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<Actividades>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text("NOMBRE ACTIVIDAD: " + snapshot.data[index].nombreActividad.toUpperCase(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          new Text("PORCENTAJE: " + snapshot.data[index].notaActividad .toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Text("NOTA: " + snapshot.data[index].porcentaje .toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Text("DEFINITIVA ACTIVIDAD: " + snapshot.data[index].definitiva.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Text("DEFINITIVA GENERAL MATERIA: " + snapshot.data[index].definitivaGeneral,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
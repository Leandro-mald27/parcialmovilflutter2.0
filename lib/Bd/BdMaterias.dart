import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:parcialmovilflutter/actividadesModelo.dart';

class DBHelper{



  static Database _db;
  Future<Database>get db async {
    if (_db == null)
      _db = await initDB();
      return _db;
  }

  Future<Database> initDB() async{
    io.Directory documentsDirectory= await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,"PARCIALMOVIL.db");
    var theDb= await openDatabase(path,version: 1,onCreate: _onCreate);
    return theDb;
  }
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE ACTIVIDADES(idActividad TEXT PRIMARY KEY, nombreActividad TEXT,notaActividad TEXT, porcentaje TEXT,def TEXT)");
    print("Created tables");
  }
  Future<List<Actividades>> getEmployees() async {
   var dbClient = await Future.value(db) ;
   List<Actividades> listaActividades= List();
   List<Map> queryList= await dbClient.rawQuery(
     'SELECT * FROM ACTIVIDADES',
   );
   for(int i =0; i<queryList.length;i++){
     listaActividades.add(Actividades.ActividadesConsulta(
       queryList[i]['idActividad'],
       queryList[i]['nombreActividad'],
       queryList[i]['notaActividad'],
       queryList[i]['porcentaje'],
       queryList[i]['def'],
     ));
   }
   return listaActividades;
  }
  void addItem(Actividades actividad) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      if((double.parse(actividad.notaActividad)>=0.0 || double.parse(actividad.notaActividad)<=5) && (int.parse(actividad.porcentaje)>0
          || int.parse(actividad.porcentaje)<=100)){
        actividad.definitiva=actividad.CalcularDefinitivaActividad(actividad.notaActividad, actividad.porcentaje);
        return await txn.rawInsert(
            'INSERT INTO ACTIVIDADES(idActividad,nombreActividad,notaActividad, porcentaje,def ) VALUES(' +
                '\'' +
                actividad.idActividad +
                '\'' +
                ',' +
                '\'' +
                actividad.nombreActividad +
                '\'' +
                ',' +
                '\'' +
                actividad.notaActividad +
                '\'' +
                ',' +
                '\'' +
                actividad.porcentaje +
                '\'' +
                ',' +
                '\'' +
                actividad.definitiva +
                '\'' +
                ')');
      }

    });
  }
}
import 'dart:ffi';

import 'package:flutter/material.dart';
class Actividades{
  String idActividad="";
  String nombreActividad="";
  String porcentaje="";
  String notaActividad="";
  String definitiva;


  Actividades(this.idActividad, this.nombreActividad, this.notaActividad,
      this.porcentaje);

  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "idActividad" : idActividad,
      "nombreActividad" : nombreActividad,
      "notaActividad" : notaActividad,
      "porcentaje":porcentaje,

    };
  }
  String CalcularDefinitivaActividad (String nota,String Porcentaje){

    var def= double.parse(nota)* (double.parse(Porcentaje))/100;
    this.definitiva= def.toString();
    return this.definitiva;

  }

  Actividades.ActividadesConsulta (this.idActividad, this.nombreActividad, this.porcentaje,
      this.notaActividad, this.definitiva);
}
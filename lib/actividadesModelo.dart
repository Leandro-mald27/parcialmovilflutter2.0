import 'dart:ffi';

import 'package:flutter/material.dart';
class Actividades{
  String idActividad="";
  String nombreActividad="";
  String porcentaje="";
  String notaActividad="";
  String definitiva;
  String definitivaGeneral;
  static int total=100;
  static int contaPorcentaje=0;
  static double definitivaTotal=0;


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
    contaPorcentaje = contaPorcentaje + int.parse(Porcentaje);
    if(contaPorcentaje<= total){
      var def= double.parse(nota)* (double.parse(Porcentaje))/100;
      this.definitiva= def.toString();
      definitivaTotal=definitivaTotal + double.parse(this.definitiva);
      this.definitivaGeneral=definitivaTotal.toString();
      return this.definitiva;
    }
    return "-1";

  }

  Actividades.ActividadesConsulta (this.idActividad, this.nombreActividad, this.porcentaje,
      this.notaActividad, this.definitiva, this.definitivaGeneral);
}
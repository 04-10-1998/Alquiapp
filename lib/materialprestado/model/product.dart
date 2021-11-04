import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Product {
  String _id;
  String _fecha;
  String _nombre;
  String _descripcion;

  Product(this._id,this._fecha,this._nombre,this._descripcion,);

  Product.map(dynamic obj){
    this._fecha = obj['fecha'];
    this._nombre = obj['nombre'];
    this._descripcion = obj['descripcion'];
  }

  String get id => _id;
  String get fecha => _fecha;
  String get nombre => _nombre;
  String get descripcion => _descripcion;


  Product.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _fecha = snapshot.value['fecha'];
    _nombre = snapshot.value['nombre'];
    _descripcion = snapshot.value['descripcion'];

  }
}
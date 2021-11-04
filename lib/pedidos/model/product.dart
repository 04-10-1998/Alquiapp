import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Pedidos {
  String _id;
  String _fecha;
  String _cliente;
  String _direccion;
  String _pedido;

  Pedidos(this._id,this._fecha,this._cliente,this._direccion,this._pedido);

  Pedidos.map(dynamic obj){
    this._fecha = obj['fecha'];
    this._cliente = obj['cliente'];
    this._direccion = obj['direccion'];
    this._pedido = obj['pedido'];
  }

  String get id => _id;
  String get fecha => _fecha;
  String get cliente => _cliente;
  String get direccion => _direccion;
  String get pedido => _pedido;


  Pedidos.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _fecha = snapshot.value['fecha'];
    _cliente = snapshot.value['cliente'];
    _direccion = snapshot.value['direccion'];
    _pedido = snapshot.value['pedido'];

  }
}
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integradora/pedidos/model/product.dart';

class PedidosInformation extends StatefulWidget {
  final Pedidos pedidos;
  PedidosInformation(this.pedidos);
  @override
  _PedidosInformationState createState() => _PedidosInformationState();
}

final pedidosReference = FirebaseDatabase.instance.reference().child('pedidos');

class _PedidosInformationState extends State<PedidosInformation> {

  List<Pedidos> items;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("Fecha : ${widget.pedidos.fecha}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Cliente : ${widget.pedidos.cliente}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Direccion : ${widget.pedidos.direccion}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Pedido : ${widget.pedidos.pedido}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
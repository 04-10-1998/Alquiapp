import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:integradora/pedidos/model/product.dart';


class PedidosScreen extends StatefulWidget {
  final Pedidos pedidos;

  PedidosScreen(this.pedidos);

  @override
  _PedidosScreenState createState() => _PedidosScreenState();
}

final pedidosReference = FirebaseDatabase.instance.reference().child('pedidos');

class _PedidosScreenState extends State<PedidosScreen> {
  List<Pedidos> items;

  TextEditingController _fechaController;
  TextEditingController _clienteController;
  TextEditingController _direccionController;
  TextEditingController _pedidoController;



  @override
  void initState() {
    super.initState();
    _fechaController = new TextEditingController(text: widget.pedidos.fecha);
    _clienteController = new TextEditingController(text: widget.pedidos.cliente);
    _direccionController = new TextEditingController(text: widget.pedidos.direccion);
    _pedidoController = new TextEditingController(text: widget.pedidos.pedido);
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Agregar Pedido'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          height: 570.0,
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _fechaController,
                  style:
                  TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), labelText: 'fecha: DD/MM/AA'),

                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  controller: _clienteController,
                  style:
                  TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Cliente'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  controller: _direccionController,
                  style:
                  TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Direccion'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  controller: _pedidoController,
                  style:
                  TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.pie_chart_outlined), labelText: 'Pedidos'),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      if (widget.pedidos.id != null){
                        pedidosReference.child(widget.pedidos.id).set({
                          'fecha': _fechaController.text,
                          'cliente': _clienteController.text,
                          'direccion': _direccionController.text,
                          'pedido': _pedidoController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }else{
                        pedidosReference.push().set({
                          'fecha': _fechaController.text,
                          'cliente': _clienteController.text,
                          'direccion': _direccionController.text,
                          'pedidos': _pedidoController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.pedidos.id != null) ? Text('Editar') : Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
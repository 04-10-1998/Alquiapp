import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:integradora/materialprestado/model/product.dart';


class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ProductScreenState extends State<ProductScreen> {
  List<Product> items;

  TextEditingController _fechaController;
  TextEditingController _nombreController;
  TextEditingController _descripcionController;



  @override
  void initState() {
    super.initState();
    _fechaController = new TextEditingController(text: widget.product.fecha);
    _nombreController = new TextEditingController(text: widget.product.nombre);
    _descripcionController = new TextEditingController(text: widget.product.descripcion);
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Agregar Agenda'),
        backgroundColor: Colors.deepOrangeAccent[700],
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
                  controller: _nombreController,
                  style:
                  TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  controller: _descripcionController,
                  style:
                  TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Nota'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      if (widget.product.id != null){
                        productReference.child(widget.product.id).set({
                          'fecha': _fechaController.text,
                          'nombre': _nombreController.text,
                          'descripcion': _descripcionController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }else{
                        productReference.push().set({
                          'fecha': _fechaController.text,
                          'nombre': _nombreController.text,
                          'descripcion': _descripcionController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.product.id != null) ? Text('Editar') : Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
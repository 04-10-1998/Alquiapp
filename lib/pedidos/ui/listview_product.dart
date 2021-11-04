import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integradora/pedidos/model/product.dart';
import 'package:integradora/pedidos/ui/product_information.dart';
import 'package:integradora/pedidos/ui/product_screen.dart';


class ListViewPedidos extends StatefulWidget {
  @override
  _ListViewPedidosState createState() => _ListViewPedidosState();
}

final pedidosReference = FirebaseDatabase.instance.reference().child('pedidos');

class _ListViewPedidosState extends State<ListViewPedidos> {
  void n=0;
  List<Pedidos> items;
  StreamSubscription<Event> _onPedidosAddedSubscription;
  StreamSubscription<Event> _onPedidosChangedSubscription;


  @override
  void initState() {
    super.initState();
    items = new List();
    _onPedidosAddedSubscription =
        pedidosReference.onChildAdded.listen(_onPedidosAdded);
    _onPedidosChangedSubscription =
        pedidosReference.onChildChanged.listen(_onPedidosUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onPedidosAddedSubscription.cancel();
    _onPedidosChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product DB',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedidos'),
          centerTitle: true,
          backgroundColor: Colors.amber[700],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 7.0,
                    ),
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${items[position].fecha}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${items[position].cliente}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  onTap: () => _navigateToProductInformation(
                                      context, items[position])),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red[900],
                              ),
                              onPressed: () => _showDialog(context, position),
                            ),

                            //onPressed: () => _deleteProduct(context, items[position],position)),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () => _navigateToProduct(
                                    context, items[position])),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.amber[700],
          onPressed: () => _createNewProduct(context),
        ),
      ),
    );
  }

  //nuevo para que pregunte antes de eliminar un registro
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.green,
              ),
              onPressed: () => _deleteProduct(
                context,
                items[position],
                position,
              ),
            ),
            new FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onPedidosAdded(Event event) {
    setState(() {
      items.add(new Pedidos.fromSnapShot(event.snapshot));
    });
  }

  void _onPedidosUpdate(Event event) {
    var oldPedidosValue =
    items.singleWhere((pedidos) => pedidos.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldPedidosValue)] =
      new Pedidos.fromSnapShot(event.snapshot);
    });
  }

  void _deleteProduct(
      BuildContext context, Pedidos pedidos, int position) async {
    await pedidosReference.child(pedidos.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navigateToProductInformation(
      BuildContext context, Pedidos pedidos) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PedidosScreen(pedidos)),
    );
  }

  void _navigateToProduct(BuildContext context, Pedidos pedidos) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PedidosInformation(pedidos)),
    );
  }

  void _createNewProduct(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PedidosScreen(Pedidos(null, '', '', '',''))),
    );
  }
}

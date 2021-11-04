import 'package:flutter/material.dart';

class SecondActivity extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SecondActivity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Informacion"),
         backgroundColor: Colors.green[700],),
        
        body: Center(
            child: Column(
          children: <Widget>[
            Center(
                child: Container(
              padding: EdgeInsets.all(28.0),
              child: Column(
                children: <Widget>[
                  Text('Empresa Bright Code'),
                  Icon(Icons.contact_phone, size: 30),
                  Text('Contactanos'),
                  Text('2491400592'),
                  Icon(Icons.contact_mail,size: 30,),
                  Text('bright_code@hotmail.com')
                ],
              ),
            ))
          ],
        )),
      ),
    );
  }
}
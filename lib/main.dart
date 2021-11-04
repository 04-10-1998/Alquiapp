import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:integradora/administrador/adminmaterial.dart' as di;
import 'package:integradora/administrador/src/presentation/home/home_page.dart';
import 'package:integradora/informacion/informacion.dart';
import 'package:integradora/pedidos/ui/listview_product.dart';
import 'materialprestado/ui/listview_product.dart';


 

void main(){
    di.init();
   runApp(MaterialApp(home: MyApp()));
   }


class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final ListViewProduct _sites = ListViewProduct();
  final HomePage _clients = HomePage();
  final ListViewPedidos _listProducts = ListViewPedidos();
  final SecondActivity _flutterpages = SecondActivity();

  Widget _showPage = ListViewPedidos();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
      return _listProducts;
      break;
      case 1:
      return _clients;
      break;
      case 2:
      return _sites;
      break;
      case 3:
      return _flutterpages;
      break;
      default:
      return new Container(
        child: new Center(
          child: new Text(
            'No page found by page chooser',
            style: new TextStyle(fontSize: 30),
          ),
          ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.note_add, size: 30),
            Icon(Icons.account_balance_wallet, size: 30),
            Icon(Icons.schedule, size: 30),
            Icon(Icons.info_outline, size: 30),
          ],
          color: Colors.cyan[300],
          buttonBackgroundColor: Colors.blue[100],
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 100),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          child: Center(
                //Text(pageIndex.toString(), textScaleFactor: 10.0),
              child: _showPage,
            ),
          ),
    );
  }
}

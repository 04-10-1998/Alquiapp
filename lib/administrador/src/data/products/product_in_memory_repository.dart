import 'dart:convert';

import 'package:integradora/administrador/src/domain/products/product.dart';
import 'package:integradora/administrador/src/domain/products/product_repository.dart';

const products = '''[
  {
    "id": "1",
    "image":
    "https://cdn.habitat.fr/thumbnails/product/814/814631/box/1200/1200/80/macadam-silla-plegable-plateado_814631.jpg",
    "title": "Silla por separado",
    "price": 3.00
  },
  {
    "id": "2",
    "image":
    "https://paginas.seccionamarilla.com.mx/img/2582/114.jpg",
    "title": "Mesa con sillas",
    "price": 50.00
  },
  {
    "id": "3",
    "image":
    "https://rentadecarpashorus.com.mx/wp-content/uploads/2017/02/mesa-vestida-en-frances-con-cubre-deshilado-640x480.jpg",
    "title": "Mesa Fundas y sobremesa",
    "price": 90.00
  },
  {
    "id": "4",
    "image":
    "https://rentadecarpaseventos.com/img/3646/408.jpg",
    "title": "Lonas 8 x 10",
    "price": 350.00
  },
  {
    "id": "5",
    "image":
    "https://alquiladoraroma.com.mx/img/lonas/lonas-alquiladora-roma-4.jpg",
    "title": "Lonas 10 x 10",
    "price": 400.00
  },
   {
    "id": "6",
    "image":
    "https://rentadelonasycarpas.com/wp-content/uploads/2017/04/08.jpg",
    "title": "Lonas 10 x 15",
    "price": 600.00
  },
   {
    "id": "7",
    "image":
    "https://alquiladoramendoza.com.mx/img/home/03-lonarentaalquiler.jpg",
    "title": "Lonas 15 x 20",
    "price": 950.00
  } 
]''';

class ProductInMemoryRepository implements ProductRepository {
  @override
  Future<List<Product>> get() async {
    return Future.delayed(
        const Duration(seconds: 2), () => _parse(jsonDecode(products)));
  }

  List<Product> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseProducts(jsonItem)).toList();
  }

  Product _parseProducts(Map<String, dynamic> json) {
    return Product(json['id'], json['image'], json['title'], json['price']);
  }
}

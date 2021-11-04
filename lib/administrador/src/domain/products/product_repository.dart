import 'package:integradora/administrador/src/domain/products/product.dart';

abstract class ProductRepository {
  Future<List<Product>> get();
}
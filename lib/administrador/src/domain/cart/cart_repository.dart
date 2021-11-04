import 'package:integradora/administrador/src/domain/cart/Cart.dart';

abstract class CartRepository {
  Future<Cart> get();

  Future<bool> save(Cart cart);
}
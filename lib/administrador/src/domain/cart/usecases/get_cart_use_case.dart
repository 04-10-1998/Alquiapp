import 'package:integradora/administrador/src/domain/cart/Cart.dart';
import 'package:integradora/administrador/src/domain/cart/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<Cart> execute() async {
    return _cartRepository.get();
  }
}
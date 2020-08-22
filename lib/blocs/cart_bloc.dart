import 'dart:async';

import 'package:blocsample/data/cart_service.dart';
import 'package:blocsample/models/cart.dart';

class CartBloc {
  // ignore: close_sinks
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  } // sink streami uyandirir!!!

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();

import 'package:flutter/widgets.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  /*
   ! We can create a list of CartItem objects for our shopping cart.
   ! But for this case we are going to map each CartItem to the ProductID of the Product we are adding to the cart
   ! Note that this ProductID is not the same as the CartItem ID
  */
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // _items[productId]!.quantity++;
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }

    notifyListeners();
  }
}
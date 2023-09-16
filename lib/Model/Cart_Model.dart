import 'package:flutter/material.dart';
import 'package:shop_app/Product/Image_Generator/ImageGeneretor.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "4.00", ImageEnum.avocado.toPath, Colors.green],
    ["Banana", "2.50", ImageEnum.banana.toPath, Colors.yellow],
    ["Chicken", "12.80", ImageEnum.chicken.toPath, Colors.brown],
    ["Water", "1.00", ImageEnum.water.toPath, Colors.blue],
  ];

  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add to ıtem
  void addItemToList(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // delete to ıtem
  void removeItemToList(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  // calculate ıtem

  String calculateTotal() {
    double totalPrice = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:soendacoffee/models/cart_model.dart';
import 'package:soendacoffee/models/product.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  // Geter dan seter

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  // Function tambah Cart

  addCart(Product product) {
    // cek apakah product itu ada jika ada prodaknya => cari indexnya

    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      // _carts[index].quantity++;
      _carts[index].quantity = _carts[index].quantity;
      // jadi lika menambahkan produk yang sama akan menambah qty saja
    } else {
      // tapi jika produknya belum ada akan menamahkan qty = 1
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

// FUnction untuk menghapus cart

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

// Function untuk tambah qty
  addQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity + 1;
    // _carts[id].quantity++;
    notifyListeners();
  }

// Function untuk mengurangi qty
  reduceQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity - 1;
    // _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

// Function total Item
  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

// Function total Harga
  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * int.parse(item.product.harga));
    }
    return total;
  }

  // cek product sudah masuk ke cart atau belum

  productExist(Product product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}

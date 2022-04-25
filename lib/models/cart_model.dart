import 'package:soendacoffee/models/product.dart';

class CartModel {
  int id;
  Product product;
  int quantity;

  // Konstruktor
  // Konstruktor digunakan untuk membuat objek yang memiliki nilai awal.
  CartModel({
    this.id,
    this.product,
    this.quantity,
  });
  // // Konstruktor untuk CartModel dari json
  // CartModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   product = Product.fromJson(json['product']);
  //   quantity = json['quantity'];
  // }

  // // function untuk mengubah CartModel ke dalam bentunk json
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'product': product.toJson(),
  //     'quantity': quantity,
  //   };
  // }

  // Function untuk mengambil total harga = data harga dikali qty
  double getTotalPrice() {
    return double.parse(product.harga) * quantity;
  }
}

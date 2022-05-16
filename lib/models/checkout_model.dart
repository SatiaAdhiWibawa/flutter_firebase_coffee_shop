import 'package:soendacoffee/models/cart_model.dart';

class CheckoutModel {
  String id,
      atasnama,
      catatan,
      nomeja,
      status,
      totalprice,
      metodepembayaran,
      shippingprice;
  DateTime createdAt, updatedAt;
  List<CartModel> items;

  CheckoutModel({
    this.id,
    this.atasnama,
    this.catatan,
    this.items,
    this.totalprice,
    this.metodepembayaran,
    this.nomeja,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.shippingprice,
  });

  // Konstruktor untuk ProductModel dari json

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    atasnama = json['atas_nama'];
    catatan = json['catatan'];
    items = json['items']
        .map<CartModel>((items) => CartModel.fromJson(items))
        .toList();
    metodepembayaran = json['metode_pembayaran'];
    nomeja = json['no_meja'];
    shippingprice = json['shipping_price'];
    status = json['status'];
    totalprice = json['total_price'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  // function untuk mengubah ProductModel ke dalam bentunk json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'atas_nama': atasnama,
      'catatan': catatan,
      'items': items.map((items) => items.toJson()).toList(),
      'metode_pembayaran': metodepembayaran,
      'no_meja': nomeja,
      'shipping_price': shippingprice,
      'status': status,
      'total_price': totalprice,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

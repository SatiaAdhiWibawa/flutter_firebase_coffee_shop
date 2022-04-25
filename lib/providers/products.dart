import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  String urlMaster = "https://soendacoffee3-default-rtdb.firebaseio.com/";
  List<Product> _allProduct = [];

  List<Product> get allProduct => _allProduct;
// get produk untuk
  List<Product> _products = [];

  List<Product> get products => _products;

// add produk

  void addProduct(String nama, String harga, String deskripsi, String katagori,
      String foto, String stok) async {
    Uri url = Uri.parse("$urlMaster/products.json");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "nama": nama,
          "harga": harga,
          "deskripsi": deskripsi,
          "katagori": katagori,
          "foto": foto,
          "stok": stok,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product data = Product(
          id: json.decode(response.body)["name"].toString(),
          nama: nama,
          harga: harga,
          deskripsi: deskripsi,
          katagori: katagori,
          foto: foto,
          stok: stok,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _allProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

// edit poduk

  void editProduct(String id, String nama, String harga, String deskripsi,
      String katagori, String foto, String stok) async {
    Uri url = Uri.parse("$urlMaster/products/$id.json");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "nama": nama,
          "harga": harga,
          "deskripsi": deskripsi,
          "katagori": katagori,
          "foto": foto,
          "stok": stok,
          "updatedAt": date.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product edit = _allProduct.firstWhere((element) => element.id == id);
        edit.nama = nama;
        edit.harga = harga;
        edit.deskripsi = deskripsi;
        edit.katagori = katagori;
        edit.foto = foto;
        edit.stok = stok;
        edit.updatedAt = date;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

// hapus produk
  void deleteProduct(String id) async {
    Uri url = Uri.parse("$urlMaster/products/$id.json");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allProduct.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

// select By ID
  Product selectById(String id) {
    return _allProduct.firstWhere((element) => element.id == id);
  }

// inisial data
  Future<void> inisialData() async {
    Uri url = Uri.parse("$urlMaster/products.json");

    try {
      var response = await http.get(url);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;

        if (data != null) {
          data.forEach(
            (key, value) {
              Product prod = Product(
                id: key,
                nama: value["nama"],
                harga: value["harga"],
                deskripsi: value["deskripsi"],
                katagori: value["katagori"],
                foto: value["foto"],
                stok: value["stok"],
                createdAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
                updatedAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
              );
              _allProduct.add(prod);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }
}

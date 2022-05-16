import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soendacoffee/models/cart_model.dart';
import 'package:soendacoffee/models/checkout_model.dart';
import 'package:intl/intl.dart';

class CheckoutProvider with ChangeNotifier {
  String urlMaster = "https://soendacoffee3-default-rtdb.firebaseio.com/";
  List<CheckoutModel> _allCheckout = [];

  List<CheckoutModel> get allCheckout => _allCheckout;

// add produk

  addCheckout(
    String atasnama,
    String selectedTempatController,
    String selectedPayController,
    List<CartModel> carts,
    String catatan,
    String totalPrice,
    // String shippingprice,
    // String status,
  ) async {
    Uri url = Uri.parse("$urlMaster/checkout.json");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'atas_nama': atasnama,
          'no_meja': selectedTempatController,
          'metode_pembayaran': selectedPayController,
          'items': carts
              .map(
                (cart) => {
                  'id': cart.product.id,
                  'quantity': cart.quantity,
                },
              )
              .toList(),
          'catatan': catatan,
          'total_price': totalPrice.toString(),
          'status': "PENDING",
          'shippingprice': "0",
          "createdAt": DateFormat('EEEE,  M/d/' 'yy  ')
              .add_Hm()
              .format(dateNow)
              .toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        CheckoutModel data = CheckoutModel(
          id: json.decode(response.body)["name"].toString(),
          atasnama: atasnama,
          nomeja: selectedTempatController,
          items: carts,
          catatan: catatan,
          totalprice: totalPrice,
          shippingprice: "0",
          createdAt: dateNow,
          updatedAt: dateNow,
        );
        print(response.body);
        _allCheckout.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

// edit Checkout

  void editCheckout(
    String id,
    String atasnama,
    String totalPrice,
    String catatan,
    String selectedTempatController,
    String selectedPayController,
    String shippingprice,
    String status,
    List<CartModel> carts,
  ) async {
    Uri url = Uri.parse("$urlMaster/checkout/$id.json");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "atasnama": atasnama,
          "catatan": catatan,
          "metode_pembayaran": selectedTempatController,
          "no_meja": selectedPayController,
          "status": status,
          "total_price": totalPrice,
          "updatedAt": date.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        CheckoutModel edit =
            _allCheckout.firstWhere((element) => element.id == id);
        // edit.atasnama = atasnama;
        // edit.catatan = catatan;
        // edit.nomeja = selectedPayController;
        // edit.shippingprice = shippingprice;
        edit.status = status;
        // edit.total_price = totalPrice;
        edit.updatedAt = date;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  // edit Status Checkout

  void editStatusCheckout(
    String id,
    String atasnama,
    String totalPrice,
    String catatan,
    String selectedTempatController,
    String selectedPayController,
    String shippingprice,
    String status,
    List<CartModel> carts,
  ) async {
    Uri url = Uri.parse("$urlMaster/checkout/$id.json");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "atas_nama": atasnama,
          "catatan": catatan,
          "metode_pembayaran": selectedTempatController,
          "no_meja": selectedPayController,
          "status": status,
          "total_price": totalPrice,
          "updatedAt": date.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        CheckoutModel edit =
            _allCheckout.firstWhere((element) => element.id == id);

        edit.status = status;

        edit.updatedAt = date;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

// hapus Checkout
  void deleteCheckout(String id) async {
    Uri url = Uri.parse("$urlMaster/checkout/$id.json");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allCheckout.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

// select Checkout By ID
  CheckoutModel selectById(String id) {
    return _allCheckout.firstWhere((element) => element.id == id);
  }

// inisial data
  Future<void> inisialData() async {
    Uri url = Uri.parse("$urlMaster/checkout.json");

    try {
      var response = await http.get(url);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;

        if (data != null) {
          data.forEach(
            (key, value) {
              CheckoutModel checkout = CheckoutModel(
                id: key,
                atasnama: value["atas_nama"],
                catatan: value["catatan"],
                // items: value["items"]
                //     .map<CartModel>((items) => CartModel.fromJson(items))
                //     .toList(),
                metodepembayaran: value["metode_pembayaran"],
                nomeja: value["no_meja"],
                shippingprice: value["shipping_price"].toString(),
                status: value["status"],
                totalprice: value["total_price"].toString(),
                createdAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
                updatedAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
              );
              _allCheckout.add(checkout);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }
}

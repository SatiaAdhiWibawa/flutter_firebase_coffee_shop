import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:soendacoffee/models/cart_model.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    // String token,
    List<CartModel> carts,
    double totalPrice,
    String atasnama,
    String catatan,
    String selectedTempatController,
    String selectedPayController,
  ) async {
    try {
      if (await TransactionService().checkout(
        carts,
        totalPrice,
        atasnama,
        catatan,
        selectedTempatController,
        selectedPayController,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class TransactionService {
  String baseUrl = 'https://soendacoffee3-default-rtdb.firebaseio.com/';

  Future<bool> checkout(
    List<CartModel> carts,
    double totalPrice,
    String atasnama,
    String catatan,
    String selectedTempatController,
    String selectedPayController,
  ) async {
    var url = '$baseUrl/checkout.json';
    DateTime dateNow = DateTime.now();

    var body = jsonEncode(
      {
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
        'status': "PENDING",
        'catatan': catatan,
        'total_price': totalPrice,
        'shipping_price': 0,
        "createdAt": dateNow.toString(),
        "updatedAt": dateNow.toString(),
      },
    );

    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}

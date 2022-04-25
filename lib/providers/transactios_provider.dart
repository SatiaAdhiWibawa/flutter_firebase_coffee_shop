/*
import 'package:flutter/cupertino.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
    String atasnama,
    String catatan,
    String selected,
  ) async {
    try {
      if (await TransactionService().checkout(
        // token,
        carts,
        totalPrice,
        atasnama,
        catatan,
        selected,
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
*/

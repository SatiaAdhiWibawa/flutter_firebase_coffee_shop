import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:soendacoffee/models/cart_model.dart';
import 'package:soendacoffee/providers/cart_provider.dart';
import 'package:soendacoffee/theme.dart';

class CartCard extends StatelessWidget {
  // Panggil CartModel

  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    // panggil Provider

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        cart.product.foto,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.product.nama,
                        style: primeryTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        // 'Rp. ${cart.product.price}',
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(double.parse(cart.product.harga)),
                        style: priceTextStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartProvider.addQuantity(cart.id);
                      },
                      child: Image.asset(
                        'assets/btn_add.png',
                        width: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      cart.quantity.toString(),
                      style: primeryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        cartProvider.reduceQuantity(cart.id);
                      },
                      child: Image.asset(
                        'assets/btn_min.png',
                        width: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                cartProvider.removeCart(cart.id);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_remove.png',
                    width: 10,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Hapus Pesanan',
                    style: pinkTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

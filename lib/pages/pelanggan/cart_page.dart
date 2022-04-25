import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/providers/cart_provider.dart';
import 'package:soendacoffee/theme.dart';
import 'package:soendacoffee/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// panggil provider

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Pesanan Anda',
          style: primeryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
        ),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_keranjang.png',
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Opss! Keranjang masih kosong',
              style:
                  primeryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Text(
              'Silahkan cari makanan favorit Anda',
              style: secondaryTextStyle,
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main-pelanggan', (route) => false);
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(
                  'Pesan Sekarang',
                  style: primeryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget customButtonNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primeryTextStyle,
                  ),
                  Text(
                    // 'Rp. ${cartProvider.totalPrice()!}',
                    NumberFormat.currency(
                            locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                        .format(cartProvider.totalPrice()),
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lanjutkan untuk Checkout',
                      style: primeryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor1,
      appBar: header(),

      // cek apakah carts == 0 maka tampilkan widget emptCart, jika ada tampilkan widget content
      body: cartProvider.carts.length == 0 ? emptyCart() : content(),

      // cek apakah carts == 0 maka tampilkan SizedBox(), jika ada tampilan Widget ButtonNav
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customButtonNav(),
    );
  }
}

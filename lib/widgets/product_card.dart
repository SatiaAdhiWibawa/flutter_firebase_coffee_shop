import 'package:flutter/material.dart';
import 'package:soendacoffee/models/product.dart';
import 'package:soendacoffee/pages/pelanggan/product_page.dart';
import 'package:soendacoffee/theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  // constructor
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigasi ke halaman ProductPage yang isinya bedasarkan product yang di klik
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductPage(product)),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                product.foto,
                height: 160,
                width: 215,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.katagori,
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product.nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.harga,
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
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

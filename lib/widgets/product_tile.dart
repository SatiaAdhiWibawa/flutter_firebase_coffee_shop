import 'package:flutter/material.dart';
import 'package:soendacoffee/models/product.dart';
import 'package:soendacoffee/pages/pelanggan/product_page.dart';
import 'package:soendacoffee/theme.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  // constructor
  ProductTile(this.product);

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
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.foto,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.katagori,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.nama,
                    style: primeryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.harga,
                    style: priceTextStyle.copyWith(
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

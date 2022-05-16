import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/theme.dart';
import 'package:intl/intl.dart';
import '../providers/products.dart';
import '../pages/admin/edit_product_page.dart';

class ProductItem extends StatelessWidget {
  final String id, nama, harga, foto, stok;

  final DateTime updatedAt;

  ProductItem(
      this.id, this.nama, this.harga, this.updatedAt, this.foto, this.stok);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Products>(context, listen: false);

    // return ListTile(
    //   onTap: () {
    //     Navigator.pushNamed(context, EditProductPage.route, arguments: id);
    //   },
    //   leading: CircleAvatar(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         image: DecorationImage(
    //           fit: BoxFit.cover,
    //           image: NetworkImage(
    //             '$foto',
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   title: Text(
    //     "$nama",
    //     style: primeryTextStyle.copyWith(
    //       fontSize: 12,
    //       fontWeight: semiBold,
    //     ),
    //   ),
    //   subtitle: Text(
    //     "Harga : Rp. $harga Stok : $stok",
    //     style: secondaryTextStyle.copyWith(
    //       fontSize: 12,
    //       fontWeight: semiBold,
    //     ),
    //   ),
    //   trailing: IconButton(
    //     icon: Icon(Icons.delete, color: primaryColor),
    //     onPressed: () {
    //       prov.deleteProduct(id);
    //     },
    //   ),
    // );
    return GestureDetector(
      onTap: () {
        // navigasi ke halaman EditProductPage yang isinya bedasarkan ID yang di klik
        Navigator.pushNamed(context, EditProductPage.route, arguments: id);
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
                '$foto',
                width: 80,
                height: 80,
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
                    "$nama",
                    style: primeryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(double.parse("$harga")),
                        // product.harga.toString(),
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.delete, color: primaryColor),
                        onPressed: () {
                          prov.deleteProduct(id);
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Stok : $stok",
                    style: secondaryTextStyle.copyWith(
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

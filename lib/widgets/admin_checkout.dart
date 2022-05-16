import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/models/product.dart';
import 'package:soendacoffee/providers/checkout_provider.dart';
import 'package:soendacoffee/theme.dart';
import 'package:intl/intl.dart';

class AdminCheckout extends StatelessWidget {
  final String id,
      atasnama,
      catatan,
      // items,
      metodepembayaran,
      nomeja,
      status,
      totalprice;
  final DateTime createdAt;
  // final Product product;

  AdminCheckout(
    // this.product,
    this.id,
    this.atasnama,
    this.catatan,
    // this.items,
    this.metodepembayaran,
    this.nomeja,
    this.status,
    this.totalprice,
    this.createdAt,
  );
  // final CheckoutModel checkout;
  // // constructor
  // AdminCheckout(this.checkout);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<CheckoutProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        // navigasi ke halaman ProductPage yang isinya bedasarkan product yang di klik
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ProductPage(product)),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 4,
        ),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/icon_kelola_transaksi.png',
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
                    "$atasnama",
                    style: primeryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Catatan",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Tempat",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Payment",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "TGL TRX",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Total",
                            style: priceTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Status",
                            style: pinkTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            "Aksi",
                            style: primeryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ":  $catatan",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            ":  $nomeja",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            ":  $metodepembayaran",
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            // DateFormat.yMd().add_jm().format(createdAt),
                            DateFormat(':  EEEE,  M/d/' 'yy  ')
                                .add_Hm()
                                .format(createdAt),
                            style: primeryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: ':  Rp ',
                                    decimalDigits: 0)
                                .format(double.parse("$totalprice")),
                            style: priceTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            ":  $status",
                            style: pinkTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                ": ",
                                style: primeryTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Icons.edit_notifications,
                                    color: primaryColor),
                                onPressed: () {
                                  // prov.editStatusCheckout(id);
                                },
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Icons.delete, color: primaryColor),
                                onPressed: () {
                                  prov.deleteCheckout(id);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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

import 'package:flutter/material.dart';

import '../../theme.dart';

class MenuAdmin extends StatefulWidget {
  @override
  _MenuAdminState createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor1,
        appBar: AppBar(
          title: Text(
            "Soenda Coffe - Menu Administrator",
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          backgroundColor: backgroundColor1,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      // onTap: () =>
                      //     Navigator.pushNamed(context, '/kelola-transaksi'),
                      child: Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.all(defaultMargin),
                        child: Column(
                          children: [
                            Image.asset("assets/icon_kelola_transaksi.png",
                                width: 120, height: 120),
                            SizedBox(height: 6),
                            Text(
                              "Kelola Transaksi",
                              style: primeryTextStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/kelola-product'),
                      child: Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.all(defaultMargin),
                        child: Column(
                          children: [
                            Image.asset("assets/icon_kelola_produk.png",
                                width: 120, height: 120),
                            SizedBox(height: 6),
                            Text(
                              "Kelola Produk",
                              style: primeryTextStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // KOLOM KEDUA
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      // onTap: () =>
                      //     Navigator.pushNamed(context, '/kelola-laporan'),
                      child: Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          right: defaultMargin,
                          bottom: defaultMargin,
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/icon_kelola_laporan.png",
                                width: 120, height: 120),
                            SizedBox(height: 6),
                            Text(
                              "Kelola Laporan",
                              style: primeryTextStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      // onTap: () =>
                      //     Navigator.pushNamed(context, '/kelola-lain-lain'),
                      child: Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          right: defaultMargin,
                          bottom: defaultMargin,
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/icon_kelola_lain.png",
                                width: 120, height: 120),
                            SizedBox(height: 6),
                            Text(
                              "Kelola lain-lain",
                              style: primeryTextStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
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

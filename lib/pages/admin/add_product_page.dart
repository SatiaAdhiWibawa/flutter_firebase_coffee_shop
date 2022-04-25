import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';
import '../../theme.dart';

class AddProductPage extends StatelessWidget {
  static const route = "/add-product";

  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController katagoriController = TextEditingController();
  final TextEditingController fotoController = TextEditingController();
  final TextEditingController stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(
      String nama,
      String harga,
      String deskripsi,
      String katagori,
      String foto,
      String stok,
    ) {
      Provider.of<Products>(context, listen: false)
          .addProduct(nama, harga, deskripsi, katagori, foto, stok);
      Navigator.pop(context);
    }

    Widget namaInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Produk',
              style: primeryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_union.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: namaController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nama Produk',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget hargaInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harga Produk',
              style: primeryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_union.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: hargaController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Harga',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget deskripsiInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi Produk',
              style: primeryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_union.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: deskripsiController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Deskripsi Produk',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget katagoriInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Katagori Produk',
              style: primeryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_union.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: katagoriController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Katagori Produk',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget fotoInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foro Produk',
              style: primeryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_union.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: fotoController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan URL Gambar',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget stokInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stok Produk',
              style: primeryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_union.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: stokController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Stok Produk',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tambahProdukButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, bottom: 50),
        child: TextButton(
          onPressed: () => save(
              namaController.text,
              hargaController.text,
              deskripsiController.text,
              katagoriController.text,
              fotoController.text,
              stokController.text),
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Tambah Produk',
            style: primeryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        title: Text("Tambah Produk"),
        elevation: 0,
        backgroundColor: backgroundColor1,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => save(
                namaController.text,
                hargaController.text,
                deskripsiController.text,
                katagoriController.text,
                fotoController.text,
                stokController.text),
          ),
        ],
      ),
      body: ListView(
        children: [
          namaInput(),
          hargaInput(),
          deskripsiInput(),
          katagoriInput(),
          fotoInput(),
          stokInput(),
          tambahProdukButton(),
        ],
      ),
    );
  }
}

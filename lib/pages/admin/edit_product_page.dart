import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/providers/products.dart';
import 'package:soendacoffee/theme.dart';

class EditProductPage extends StatelessWidget {
  static const route = "/edit-product";

  @override
  Widget build(BuildContext context) {
    String prodId = ModalRoute.of(context).settings.arguments as String;

    var prov = Provider.of<Products>(context, listen: false);

    var selectedProduct = prov.selectById(prodId);

    final TextEditingController namaController =
        TextEditingController(text: selectedProduct.nama);
    final TextEditingController hargaController =
        TextEditingController(text: selectedProduct.harga.toString());
    final TextEditingController deskripsiController =
        TextEditingController(text: selectedProduct.nama);
    final TextEditingController katagoriController =
        TextEditingController(text: selectedProduct.katagori);
    final TextEditingController fotoController =
        TextEditingController(text: selectedProduct.foto);
    final TextEditingController stokController =
        TextEditingController(text: selectedProduct.stok);

    void edit(String nama, String harga, String deskripsi, String katagori,
        String foto, String stok) {
      prov.editProduct(prodId, nama, harga, deskripsi, katagori, foto, stok);
      Navigator.pop(context);
    }

    Widget namaInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
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

    Widget editProdukButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, bottom: 50),
        child: TextButton(
          onPressed: () => edit(
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
            'Edit Produk',
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
        title: Center(child: Text("Edit Produk")),
        elevation: 0,
        backgroundColor: backgroundColor1,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => edit(
                namaController.text,
                hargaController.text,
                deskripsiController.text,
                katagoriController.text,
                fotoController.text,
                stokController.text),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            namaInput(),
            hargaInput(),
            deskripsiInput(),
            katagoriInput(),
            fotoInput(),
            stokInput(),
            editProdukButton(),
          ],
        ),
      ),
    );
  }
}

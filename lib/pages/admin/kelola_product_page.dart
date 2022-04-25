import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/theme.dart';

import '../../providers/products.dart';

import 'add_product_page.dart';
import '../../widgets/product_item.dart';

class KelolaProductPage extends StatefulWidget {
  static const route = "/kelola-product";

  @override
  _KelolaProductPageState createState() => _KelolaProductPageState();
}

class _KelolaProductPageState extends State<KelolaProductPage> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<Products>(context, listen: false).inisialData().then((value) {
        setState(() {
          isLoading = false;
        });
      }).catchError(
        (err) {
          print(err);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error Occured"),
                content: Text(err.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Okay"),
                  ),
                ],
              );
            },
          );
        },
      );

      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelola Produk"),
        backgroundColor: backgroundColor1,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, AddProductPage.route),
          ),
        ],
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (prov.allProduct.length == 0)
              ? Center(
                  child: Text(
                    "Tidak ada data",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: prov.allProduct.length,
                  itemBuilder: (context, i) => ProductItem(
                    prov.allProduct[i].id,
                    prov.allProduct[i].nama,
                    prov.allProduct[i].harga,
                    prov.allProduct[i].updatedAt,
                    prov.allProduct[i].foto,
                    prov.allProduct[i].stok,
                  ),
                ),
    );
  }
}

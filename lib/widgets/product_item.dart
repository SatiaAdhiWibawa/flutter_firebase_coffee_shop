import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    // String date = DateFormat.yMMMd().add_Hms().format(updatedAt);

    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, EditProductPage.route, arguments: id);
      },
      leading: CircleAvatar(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "$foto",
              ),
            ),
          ),
        ),
      ),
      title: Text("$nama"),
      subtitle: Text(
        "Harga : $harga Stok : $stok",
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          prov.deleteProduct(id);
        },
      ),
    );
  }
}

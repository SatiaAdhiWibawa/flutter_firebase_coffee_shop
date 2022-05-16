import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/providers/checkout_provider.dart';
import 'package:soendacoffee/theme.dart';
import 'package:soendacoffee/widgets/admin_checkout.dart';

class KelolaTransaksiPage extends StatefulWidget {
  static const route = "/kelola-transaksi";

  @override
  _KelolaTransaksiPageState createState() => _KelolaTransaksiPageState();
}

class _KelolaTransaksiPageState extends State<KelolaTransaksiPage> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<CheckoutProvider>(context, listen: false)
          .inisialData()
          .then((value) {
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
    final prov = Provider.of<CheckoutProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        title: Center(child: Text("Kelola Transaksi")),
        backgroundColor: backgroundColor1,
        elevation: 0,
        actions: [
          // IconButton(
          //   icon: Icon(Icons.add),
          //   // onPressed: () => Navigator.pushNamed(context, AddProductPage.route),
          // ),
        ],
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (prov.allCheckout.length == 0)
              ? Center(
                  child: Text(
                    "Tidak ada data",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )
              //           : Row(
              //               children: prov.allCheckout
              //                   .map(
              //                     (checkout) => AdminCheckout(checkout),
              //                   )
              //                   .toList(),
              //             ),
              // );
              : ListView.builder(
                  itemCount: prov.allCheckout.length,
                  itemBuilder: (context, i) => AdminCheckout(
                    prov.allCheckout[i].id,
                    prov.allCheckout[i].atasnama,
                    prov.allCheckout[i].catatan,
                    // prov.allCheckout[i].items,
                    prov.allCheckout[i].metodepembayaran,
                    prov.allCheckout[i].nomeja,
                    prov.allCheckout[i].status,
                    prov.allCheckout[i].totalprice,
                    prov.allCheckout[i].createdAt,
                  ),
                ),
    );
  }
}

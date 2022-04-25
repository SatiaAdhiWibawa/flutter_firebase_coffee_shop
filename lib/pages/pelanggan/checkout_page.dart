import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/widgets/checkout_card.dart';
import 'package:soendacoffee/widgets/loading_button.dart';
import 'package:soendacoffee/providers/cart_provider.dart';
import 'package:soendacoffee/theme.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

TextEditingController atasNamaController = TextEditingController(text: '');
TextEditingController catatanController = TextEditingController(text: '');
TextEditingController selected = TextEditingController(text: '');

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;
  String selected;

  List<String> data = [
    "Makan dirumah",
    "Meja No.1",
    "Meja No.2",
    "Meja No.3",
    "Meja No.4",
    "Meja No.5",
    "Meja No.6",
    "Meja No.7",
    "Meja No.8",
    "Meja No.9",
    "Meja No.10",
    "Meja No.11",
    "Meja No.12",
    "Meja No.13",
    "Meja No.14",
    "Meja No.15",
  ];

  @override
  Widget build(BuildContext context) {
    // panggil provider

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    // TransactionProvider transactionPovider =
    //     Provider.of<TransactionProvider>(context);
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // handleCheckout() async {
    //   setState(() {
    //     isLoading = true;
    //   });
//       if (await transactionPovider.checkout(
//         // authProvider.user.token,
//         cartProvider.carts,
//         cartProvider.totalPrice(),
//         atasNamaController.text,
//         catatanController.text,
//         selected.toString(),
//       )) {
//         cartProvider.carts = []; //untuk clear carts menjadi kosong
//         Navigator.pushNamedAndRemoveUntil(
//             context, '/checkout-success', (route) => false);
//       }
// // jika proses selesai maka set loading jadi false
//       setState(() {
//         isLoading = false;
//       });
//     }

    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
        ),
      );
    }

    Widget pesananDetail() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atas Nama :',
              style: secondaryTextStyle.copyWith(
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
                color: backgroundColor3,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_user.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primeryTextStyle,
                        controller: atasNamaController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Input Nama',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Catatan :',
              style: secondaryTextStyle.copyWith(
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
                color: backgroundColor3,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primeryTextStyle,
                        controller: catatanController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tulis catatan di sini',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tempat :',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),

            // Dropdown button

            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownSearch<String>(
                dropdownSearchBaseStyle: primeryTextStyle,
                showClearButton: true,
                mode: Mode.DIALOG,
                showSelectedItem: true,
                items: data,
                hint: "Silahkan pilih tempat",
                popupItemDisabled: (String s) => s.startsWith('Z'),
                onChanged: (value) {
                  print(value);
                  selected = (value);
                },
                // onFind: (String value) => getData(value),
                // selectedItem: "Pilih tempat",
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          // NOTE: PESANAN DETAILS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesanan Detail',
                  style: primeryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(height: 12),

                pesananDetail(), // Menggunakan TextFormField
              ],
            ),
          ),

          // NOTE : LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primeryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          // NOTE : RINCIAN PEMBAYARAN
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rincian Pembayaran',
                  style: primeryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()}',
                      style: primeryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      // 'Rp. ${cartProvider.totalPrice()}',
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(cartProvider.totalPrice()),

                      style: primeryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ppn',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primeryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  thickness: 1,
                  color: subtitleColor,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      // 'Rp. ${cartProvider.totalPrice()}',
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(cartProvider.totalPrice()),
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // NOTE : CHECKOUT BUTTON
          SizedBox(height: defaultMargin),
          Divider(
            thickness: 1,
            color: subtitleColor,
          ),

          // jika loading = true tapikan loading button, jika false container
          isLoading
              ? Container(
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  child: LoadingButton())
              : Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: defaultMargin,
                  ),
                  child: TextButton(
                    onPressed: () {}, //handleCheckout
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Checkout Sekarang',
                      style: primeryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: header(),
      body: content(),
    );
  }
}

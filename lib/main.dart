import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soendacoffee/pages/admin/detail_transaksi_page.dart';
import 'package:soendacoffee/pages/admin/kelola_transaksi_page.dart';
import 'package:soendacoffee/pages/admin/main_page.dart';
import 'package:soendacoffee/pages/sign_in_page.dart';
import 'package:soendacoffee/pages/pelanggan/cart_page.dart';
import 'package:soendacoffee/pages/pelanggan/checkout_page.dart';
import 'package:soendacoffee/pages/pelanggan/checkout_success_page.dart';
import 'package:soendacoffee/pages/pelanggan/main_page.dart';
import 'package:soendacoffee/pages/sign_up_page.dart';
import 'package:soendacoffee/pages/splash_page.dart';
import 'package:soendacoffee/providers/auth_helper.dart';
import 'package:soendacoffee/pages/admin/kelola_product_page.dart';
import 'package:soendacoffee/pages/admin/add_product_page.dart';
import 'package:soendacoffee/pages/admin/edit_product_page.dart';
import 'package:soendacoffee/providers/cart_provider.dart';
import 'package:soendacoffee/providers/checkout_provider.dart';
import 'package:soendacoffee/providers/transaction_provider.dart';

import './providers/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => TransactionProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/utama': (context) => MainScreen(),
          '/sign-in': (context) => SignInPag(),
          '/sign-up': (context) => SignupPage(),
          '/main-admin': (context) => MainPageAdmin(),
          '/kelola-product': (context) => KelolaProductPage(),
          '/add-product': (context) => AddProductPage(),
          '/edit-product': (context) => EditProductPage(),
          '/kelola-transaksi': (context) => KelolaTransaksiPage(),
          '/edit-transaksi': (context) => DetailTransaksiPage(),
          '/main-pelanggan': (context) => MainPagePelanggan(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  if (user['role'] == 'admin') {
                    return MainPageAdmin();
                  } else {
                    return MainPagePelanggan();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return SignInPag();
        });
  }
}

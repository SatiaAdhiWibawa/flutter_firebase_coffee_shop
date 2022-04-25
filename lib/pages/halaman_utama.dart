import 'package:flutter/material.dart';
import 'package:soendacoffee/theme.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  Widget kelolaAdmin() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(defaultMargin),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Halaman Administrator',
          style: primeryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  Widget orderPage() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(defaultMargin),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/main-pelanggan');
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Menu Order',
          style: primeryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/logo1.png',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            orderPage(),
            kelolaAdmin(),
          ],
        ),
      ),
    );
  }
}

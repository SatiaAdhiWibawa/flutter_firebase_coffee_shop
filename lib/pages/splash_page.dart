import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soendacoffee/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // mengatur waktu tunggu dari splash page
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/utama'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
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
      ),
    );
  }
}

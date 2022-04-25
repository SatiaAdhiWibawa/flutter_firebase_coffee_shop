import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soendacoffee/models/product.dart';
import 'package:soendacoffee/theme.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  // constructor
  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_p4.png',
    'assets/image_p5.png',
    'assets/image_p9.jpg',
  ];

  List popularFoods = [
    'assets/image_p3.png',
    'assets/image_p4.png',
    'assets/image_p5.png',
    'assets/image_p3.png',
    'assets/image_p4.png',
    'assets/image_p5.png',
    'assets/image_p3.png',
    'assets/image_p5.png',
    'assets/image_p4.png',
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Berhasil :)',
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Berhasil menambahkan item',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text(
                        'Lihat Pesanan',
                        style: primeryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //apakah curentindex == index jika ya maka tampilkan primarycolor jika tidak tampilkan warna lain
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget popularFoodsCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    header() {
      int index = -1;
      return Stack(
        alignment: Alignment.center,
        children: [
          // ICON
          Container(
            height: 320,
            child: CarouselSlider(
              items: widget.product.galeri
                  .map(
                    (image) => Image.network(
                      image.url,
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          // SizedBox(height: 25),
          //IMAGES
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Icon(
                Icons.shopping_bag,
                color: primaryColor,
              ),
            ),
          ),
// INDICATOR
          Positioned(
            top: 300,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((e) {
                  index++;
                  return indicator(index);
                }).toList(),
              ),
            ),
          ),
        ],
      );
    }

    header1() {
      return Stack(
        alignment: Alignment.center,
        children: [
          // ICON
          Container(
            height: 320,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.network(
              widget.product.foto,
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox(height: 25),
          //IMAGES
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: primaryColor,
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Icon(
                Icons.shopping_bag,
                color: primaryColor,
              ),
            ),
          ),
// INDICATOR
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // NOTE: HEADER
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.nama,
                            style: primeryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            widget.product.katagori,
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // NOTE: Price
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 20,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: primeryTextStyle,
                    ),
                    Text(
                      widget.product.harga,
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),

              // NOTE: Deskripsi
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: primeryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.product.deskripsi,
                      style: subtitleTextStyle.copyWith(fontWeight: light),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              // NOTE : Popular Product
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Text(
                        'Popular Foods',
                        style: primeryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: popularFoods.map((image) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: popularFoodsCard(image),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),

              //  NOTE: BUTTONS
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(defaultMargin),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 54,
                        child: TextButton(
                          onPressed: () {
                            showSuccessDialog();
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor,
                          ),
                          child: Text(
                            'Tambahkan Pesanan',
                            style: primeryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
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

    return Scaffold(
      backgroundColor: backgroundColor4,
      body: ListView(
        children: [
          header1(),
          content(),
        ],
      ),
    );
  }
}

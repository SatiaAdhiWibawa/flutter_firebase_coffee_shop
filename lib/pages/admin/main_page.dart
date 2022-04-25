import 'package:flutter/material.dart';
import 'package:soendacoffee/pages/admin/menu_admin.dart';
import 'package:soendacoffee/pages/admin/profile_page.dart';
import 'package:soendacoffee/theme.dart';

class MainPageAdmin extends StatefulWidget {
  @override
  _MainPageAdminState createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  int currentIndex = 0; //yang pertama di tampilkan adalah currenindex 0
  @override
  Widget build(BuildContext context) {
    Widget customBottonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: primaryTextColor,
            currentIndex: currentIndex,
            // saat kita klik button navigation yg home ini maka akan muncul value
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 24,
                    color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 24,
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return MenuAdmin();
        case 1:
          return ProfilePage();
        default:
          return MenuAdmin();
      }
    }

    return Scaffold(
      // backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      backgroundColor: backgroundColor1,
      bottomNavigationBar: customBottonNav(),
      body: body(),
    );
  }
}

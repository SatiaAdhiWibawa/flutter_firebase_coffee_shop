import 'package:flutter/material.dart';
import 'package:soendacoffee/providers/auth_helper.dart';
import 'package:soendacoffee/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image_profile.png',
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, Admin Soenda Coffee',
                        style: primeryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '@SoendaCoffee',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AuthHelper.logOut();
                  },
                  child: Image.asset(
                    'assets/exit_button.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor1,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'About Apps',
                  style: primeryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: menuItem('Edit Profile'),
                ),
                menuItem('About'),
                menuItem('Help'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'General',
                  style: primeryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                menuItem('Privacy & Policy'),
                menuItem('Term of Service'),
                menuItem('Rate App'),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [header(), content()],
      ),
    );
  }
}

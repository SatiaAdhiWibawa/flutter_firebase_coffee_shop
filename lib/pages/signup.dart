import 'package:flutter/material.dart';
import 'package:soendacoffee/providers/auth_helper.dart';
import 'package:soendacoffee/theme.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // controler

  String txtemail, txtpassword;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _confirmPasswordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        // margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primeryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign Up to Continue',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primeryTextStyle.copyWith(
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
                color: backgroundColor2,
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
                        controller: _emailController,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                        onSaved: (value) {
                          txtemail = value;
                        },
                        validator: validateEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primeryTextStyle.copyWith(
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
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_pass.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                        onSaved: (value) {
                          txtpassword = value;
                        },
                        validator: validatepassword,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget confirmPasswordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primeryTextStyle.copyWith(
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
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_pass.png',
                      width: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        style: primeryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Confirm Password',
                          hintStyle: subtitleTextStyle,
                        ),
                        onSaved: (value) {
                          txtpassword = value;
                        },
                        validator: validatepassword,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget withGoogle() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: () async {
            try {
              await AuthHelper.signInWithGoogle();
            } catch (e) {
              print(e);
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: hitam,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/google.png',
                width: 24,
              ),
              SizedBox(width: 6),
              Text(
                'Sign Up with Google',
                style: primeryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () async {
            // validasi ketika ada yg belum di isi
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
            // validasi ketika ada yg belum di isi (print di konsol)
            if (_emailController.text.isEmpty ||
                _passwordController.text.isEmpty) {
              print("Email and password cannot be empty");
              return;
            }
            // validasi ketik password 1 dan 2 tidak sama (print di konsol)
            if (_confirmPasswordController.text.isEmpty ||
                _passwordController.text != _confirmPasswordController.text) {
              print("confirm password does not match");
              return;
            }
            try {
              final user = await AuthHelper.signupWithEmail(
                  email: _emailController.text,
                  password: _passwordController.text);
              if (user != null) {
                print("signup successful");
                Navigator.pop(context);
              }
            } catch (e) {
              print(e);
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign Up',
            style: primeryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    // semua halaman

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                header(),
                emailInput(),
                passwordInput(),
                confirmPasswordInput(),
                signUpButton(),
                withGoogle(),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Masukan Email!';
    } else {
      return null;
    }
  }

  String validatepassword(String password) {
    if (password.isEmpty) {
      return 'Masukan Password!';
    } else {
      return null;
    }
  }
}

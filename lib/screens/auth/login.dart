import 'package:ecommerce_app/utils/auth_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/screens/auth/controllers/auth_controller.dart';
import 'package:ecommerce_app/screens/auth/forget_password.dart';
import 'package:ecommerce_app/screens/auth/sign_up.dart';
import 'package:ecommerce_app/screens/bottom_menu.dart';
import 'package:get/get.dart';

import '../../utils/my_string.dart';
import '../../utils/theme.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '\LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController()
        .LoginUser(_emailController.text, _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomMenu()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                AuthTextFromField(
                  controller: _emailController,
                  obscureText: false,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode
                      ? const Icon(
                    Icons.email,
                    color: pinkClr,
                    size: 30,
                  )
                      : Image.asset('assets/images/email.png'),
                  suffixIcon: const Text(""),
                  hintText: 'E-Posta',
                ),
                SizedBox(
                  height: 20,
                ),
                AuthTextFromField(

                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid pass';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode
                      ? const Icon(
                    Icons.email,
                    color: pinkClr,
                    size: 30,
                  )
                      : Image.asset('assets/images/lock.png'),
                  suffixIcon: const Text(""),
                  hintText: 'Şifre',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width  /4,
                  height: 50,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      color: mainColor),
                  child: Center(
                    child: InkWell(
                      onTap: loginUser,
                      child: _isLoading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                          : Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ForgetPassword.routeName);
                      },
                      splashColor: Colors.grey,
                      child: Text(
                        'Forget Password ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an Account?'),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
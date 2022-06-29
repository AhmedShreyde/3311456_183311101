import 'package:ecommerce_app/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/order_provider.dart';
import 'package:ecommerce_app/provider/product.dart';
import 'package:ecommerce_app/screens/auth/forget_password.dart';
import 'package:ecommerce_app/screens/auth/login.dart';
import 'package:ecommerce_app/screens/auth/onboarding_page.dart';
import 'package:ecommerce_app/screens/auth/sign_up.dart';
import 'package:ecommerce_app/screens/bottom_menu.dart';
import 'package:ecommerce_app/screens/detail/category_detail.dart';
import 'package:ecommerce_app/screens/detail/widgets/feeds_detail.dart';
import 'package:ecommerce_app/screens/feeds.dart';
import 'package:ecommerce_app/screens/landing_page.dart';
import 'package:ecommerce_app/screens/orders/order.dart';
import 'package:provider/provider.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return Products();
        }),
        ChangeNotifierProvider(create: (_) {
          return CartProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return OrderProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return OrderProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            backgroundColor: Colors.white,
            primaryColor: mainColor,
            // ignore: deprecated_member_use
            accentColor: Colors.white),
        home: OnboardingPage(),
        routes: {
          FeedsScreen.routeName: (ctx) => FeedsScreen(),
          FeedDetail.routeName: (ctx) => FeedDetail(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUp.routeName: (ctx) => SignUp(),
          LandingPage.routeName: (ctx) => LandingPage(),
          BottomMenu.routeName: (ctx) => BottomMenu(),
          CategoryDetail.routeName: (ctx) => CategoryDetail(),
          ForgetPassword.routeName: (ctx) => ForgetPassword(),
          Order.routeName: (ctx) => Order()
        },
      ),
    );
  }
}
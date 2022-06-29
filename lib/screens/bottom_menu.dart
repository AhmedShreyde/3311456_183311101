import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/provider/product.dart';
import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/screens/feeds.dart';
import 'package:ecommerce_app/screens/home/home.dart';
import 'package:ecommerce_app/screens/search.dart';
import 'package:ecommerce_app/screens/upload_product_form.dart';
import 'package:ecommerce_app/screens/user.dart';
import 'package:provider/provider.dart';

class BottomMenu extends StatefulWidget {
  static const routeName = '/BottomMenu';

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int pageIndex = 0;
  var _pages;
  // final List _pages = [
  //   HomePage(),
  //   FeedsScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserInfo()
  // ];

  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
      },
      {
        'page': FeedsScreen(),
      },
      {
      // 'page': SearchScreen(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UploadProductForm(),
      },
      {
        'page': UserInfo(),
      }
    ];
    super.initState();
  }

  // }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    // productData.fetchProducts();
    return Scaffold(
      body: _pages[pageIndex]['page'],

      bottomNavigationBar: CupertinoTabBar(
        height: 60,
        activeColor: mainColor,
        inactiveColor: Colors.black87,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rss_feed,
              size: 30,
            ),
            label: 'Feeds',
            tooltip: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 40,
            ),
            label: 'Search',
            tooltip: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
            ),
            label: 'Cart',
            tooltip: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.upload_circle_fill,
              size: 30,
            ),
            label: 'Upload',
            tooltip: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/user.png',
              width: 30,
            ),
            label: 'User',
            tooltip: 'User',
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/models/feed_product.dart';
import 'package:ecommerce_app/provider/product.dart';
import 'package:ecommerce_app/screens/home/widgets/custorm_bar.dart';
import 'package:ecommerce_app/screens/home/widgets/new_arrival.dart';
import 'package:ecommerce_app/screens/home/widgets/popular_product.dart';
import 'package:ecommerce_app/screens/home/widgets/reuseable_text.dart';
import 'package:ecommerce_app/screens/home/widgets/search_input.dart';
import 'package:ecommerce_app/screens/home/widgets/tag_list.dart';
import 'package:ecommerce_app/screens/widgets/category.dart';
import 'package:ecommerce_app/screens/widgets/category_listview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final bottomList = ['######', '######', '#######', '##########'];
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    productData.fetchProducts();

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomBar(),
          SearchInput(),
          TagList(),
          //ReuseableText('Categories'),
          CategoryListView(),

          NewArrival(),
        ]),
      ),
    );
  }
}
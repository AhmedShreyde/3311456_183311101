import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/models/feed_product.dart';
import 'package:ecommerce_app/provider/product.dart';
import 'package:ecommerce_app/screens/home/widgets/clothes_item.dart';
import 'package:ecommerce_app/screens/home/widgets/reuseable_text.dart';
import 'package:provider/provider.dart';

class NewArrival extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    List<ProductModel> productList = productsProvider.products;
    return Column(
      children: [
        ReuseableText(' Yeni Gelen '),
        Container(
          height: 280,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: productList[index],
                child: ClothesItem(),
              ),
              separatorBuilder: (_, index) => SizedBox(
                width: 10,
              ),
              itemCount: productList.length),
        )
      ],
    );
  }
}
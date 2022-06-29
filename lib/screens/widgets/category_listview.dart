import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/widgets/category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext ctx, int index) {
            return Category(index);
          }),
    );
  }
}
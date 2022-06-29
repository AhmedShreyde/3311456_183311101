import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/feed_product.dart';
import 'package:ecommerce_app/provider/product.dart';
import 'package:ecommerce_app/screens/detail/widgets/feeds_detail.dart';
import 'package:provider/provider.dart';

class FeedProduct extends StatefulWidget {
  @override
  _FeedProductState createState() => _FeedProductState();
}

class _FeedProductState extends State<FeedProduct> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(FeedDetail.routeName, arguments: products.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage('${products.imageUrl}'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Badge(
                        toAnimate: true,
                        shape: BadgeShape.square,
                        badgeColor: Colors.pink,
                        borderRadius: BorderRadius.circular(8),
                        badgeContent:
                        Text('Yeni', style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
                Text(
                  '${products.tiltle}'.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                Text(
                  '\TL ${products.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
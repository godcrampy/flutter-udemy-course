import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Map> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ProductCard(products[index], index),
            itemCount: products.length,
          )
        : Center(child: Text('Oops, No Products to Display'));
  }
}

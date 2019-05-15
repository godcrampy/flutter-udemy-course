import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          "\$" + price.toStringAsFixed(2),
          style: TextStyle(color: Colors.white),
        ));
  }
}

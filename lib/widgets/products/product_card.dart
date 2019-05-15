import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/products/address_tag.dart';
import 'package:flutter_course/widgets/products/price_tag.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  ProductCard(this.product, this.index);

  Widget _buildTitlePriceRow() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TitleDefault(product['title']),
          SizedBox(width: 5.0),
          PriceTag(product['price'])
        ]));
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.lightBlue,
            ),
            // child: Text('Details'),
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + index.toString())),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.pinkAccent,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Image.asset(product['image']),
              _buildTitlePriceRow(),
              AddressTag('Union Square, San Francisco'),
              _buildActionButtons(context)
            ],
          ),
        ));
  }
}

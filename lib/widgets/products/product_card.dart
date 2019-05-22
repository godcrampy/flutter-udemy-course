import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scoped-models/main.dart';
import 'package:flutter_course/widgets/products/address_tag.dart';
import 'package:flutter_course/widgets/products/price_tag.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard(this.product, this.index);

  Widget _buildTitlePriceRow() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TitleDefault(product.title),
          SizedBox(width: 5.0),
          PriceTag(product.price)
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
        GestureDetector(onLongPress: () {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Like")));
        }, child: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(
                model.getProducts[index].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.pinkAccent,
              ),
              onPressed: () {
                model.selectProduct(index);
                model.toggleProductFavoriteStatus();
              },
            );
          },
        ))
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
              Image.network(product.image),
              _buildTitlePriceRow(),
              AddressTag('Union Square, San Francisco'),
              Text(product.userEmail),
              _buildActionButtons(context)
            ],
          ),
        ));
  }
}

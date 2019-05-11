import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductController extends StatelessWidget {
  final Function addProduct;

  ProductController(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
      onPressed: () {
        addProduct('Sweets');
      },
      child: Text('Add Product'),
    );
  }
}

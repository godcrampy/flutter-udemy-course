import 'package:flutter/material.dart';

class ProductController extends StatelessWidget{
  final Function addProduct;
  
  ProductController(this.addProduct);


  @override
  Widget build(BuildContext context) {

    return RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: () {
            addProduct();
          },
          child: Text('Add Product'),
        );
  }


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductController extends StatelessWidget{
  final Function addProduct;
  
  ProductController(this.addProduct);


  @override
  Widget build(BuildContext context) {

    return CupertinoButton(
          disabledColor: Colors.red,
          color: Theme.of(context).accentColor,
          
          onPressed: () {
            addProduct('Sweets');
          },
          child: Text('Add Product'),
        );
  }


}
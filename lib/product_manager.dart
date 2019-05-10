import 'package:flutter/material.dart';
import 'package:flutter_course/products.dart';
import 'package:flutter_course/products_controller.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = "Sweets Tester"});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(){
    setState(() {
              _products.add('Food Heater');
            });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductController(_addProduct)
      ),
      Products(_products)
    ]);
  }
}

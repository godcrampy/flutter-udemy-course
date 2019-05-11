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
  List<Map> _products = [];

  @override
  void initState() {
    // _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(Map product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(index){
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0), child: ProductController(_addProduct)),
      Expanded(child: Products(_products, _deleteProduct))
    ]);
  }
}

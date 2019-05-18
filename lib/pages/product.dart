import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';
import '../scoped-models/products.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {
  final int index;
  ProductPage(this.index);

  Widget _buildAddressPriceRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco' +
              " | \$" +
              product.price.toStringAsFixed(2),
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald'),
        ),
      ],
    );
  }

  // _showWarningDialogue(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Are You Sure"),
  //           content: Text("This action cannot be undone"),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('Cancel'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('Delete'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 Navigator.pop(context, true);
  //                 deleteProduct(index);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      Product product = model.products[index];
      return WillPopScope(
          onWillPop: () {
            Navigator.pop(context, false);
          },
          child: Scaffold(
              appBar: AppBar(
                title: Text(product.title),
              ),
              body: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(product.image),
                      SizedBox(
                        height: 10,
                      ),
                      TitleDefault(product.title),
                      SizedBox(
                        height: 10,
                      ),
                      _buildAddressPriceRow(product),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          product.description,
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ]),
              )));
    });
  }
}

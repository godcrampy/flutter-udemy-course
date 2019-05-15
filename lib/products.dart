import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(margin: EdgeInsets.only(top: 10.0), 
            child: Text(products[index]['title'], style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'), )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text('Details'),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString()))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : Center(child: Text('Oops, No Products to Display'));
  }
}

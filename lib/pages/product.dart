import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset('assets/food.jpg'),
            Container(
                padding: EdgeInsets.all(10.0), child: Text('Product Page')),
            RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text('Back'),
              onPressed: () => Navigator.pop(context),
            )
          ]),
        ));
  }
}

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String image;
  final int index;
  final Function deleteProduct;
  ProductPage(this.title, this.image, this.index, this.deleteProduct);

  _showWarningDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are You Sure"),
            content: Text("This Actin cant be undone"),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                  deleteProduct(index);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(image),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Product Page')),
                    RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        child: Text('Delete Product'),
                        onPressed: () {
                          _showWarningDialogue(context);
                        })
                  ]),
            )));
  }
}

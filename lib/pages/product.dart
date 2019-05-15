import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final double price;
  final int index;
  final Function deleteProduct;
  ProductPage(this.title, this.image, this.description, this.price, this.index,
      this.deleteProduct);

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco' + " | \$" + price.toStringAsFixed(2),
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald'),
        ),
      ],
    );
  }

  _showWarningDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are You Sure"),
            content: Text("This action cannot be undone"),
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
                    SizedBox(
                      height: 10,
                    ),
                    TitleDefault(title),
                    SizedBox(
                      height: 10,
                    ),
                    _buildAddressPriceRow(),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    IconButton(
                        color: Theme.of(context).accentColor,
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _showWarningDialogue(context);
                        })
                  ]),
            )));
  }
}

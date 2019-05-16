import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;
  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage(
            product: products[index],
            updateProduct: updateProduct,
            productIndex: index,
          );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                deleteProduct(index);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Product Deleted")));
              }
            },
            key: Key(products[index]['title']),
            child: Column(children: [
              ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(
                    products[index]['image'],
                  )),
                  title: Text(products[index]['title']),
                  subtitle:
                      Text("\$" + products[index]['price'].toStringAsFixed(2)),
                  trailing: _buildEditButton(context, index)),
              Divider()
            ]));
      },
      itemCount: products.length,
    );
  }
}

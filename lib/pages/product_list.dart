import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_edit.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(
      BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage(
              // product: products[index],
              // updateProduct: updateProduct,
              // productIndex: index,
              );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
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
                  model.selectProduct(index);
                  model.deleteProduct();
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Product Deleted")));
                }
              },
              key: Key(model.products[index].title),
              child: Column(children: [
                ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                      model.products[index].image,
                    )),
                    title: Text(model.products[index].title),
                    subtitle: Text(
                        "\$" + model.products[index].price.toStringAsFixed(2)),
                    trailing: _buildEditButton(context, index, model)),
                Divider()
              ]));
        },
        itemCount: model.products.length,
      );
    });
  }
}

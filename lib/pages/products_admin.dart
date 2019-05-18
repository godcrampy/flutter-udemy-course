import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/pages/product_edit.dart';
import 'package:flutter_course/pages/product_list.dart';

class ProductsAdminPage extends StatelessWidget {

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Manage Products"),
          ),
          ListTile(
            leading: Icon(Icons.shop_two),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: _buildSideDrawer(context),
            appBar: AppBar(
              title: Text('Manage Products'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.add),
                    text: 'Create Product',
                  ),
                  Tab(
                    text: 'My Products',
                    icon: Icon(Icons.list),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ProductEditPage(),
                ProductListPage()
              ],
            )));
  }
}

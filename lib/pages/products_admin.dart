import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_create.dart';
import 'package:flutter_course/pages/product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    title: Text("Manage Products"),
                  ),
                  ListTile(
                    title: Text('All Products'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  )
                ],
              ),
            ),
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
              children: <Widget>[ProductCreatePage(), ProductListPage()],
            )));
  }
}

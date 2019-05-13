import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/pages/products_admin.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  void _addProduct(Map product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, accentColor: Colors.orange),
      // home: AuthPage(),
      routes: {
        '/admin': (BuildContext context) => ProductsAdminPage(),
        '/': (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index]['title'], _products[index]['imageUrl']));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          ProductsPage(_products, _addProduct, _deleteProduct);
        });
      },
    );
  }
}

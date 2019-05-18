import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';
import '../models/product.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditStatePageState();
  }
}

class _ProductEditStatePageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': Null,
    'description': Null,
    'price': Null,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? '' : product.title,
      decoration: InputDecoration(labelText: 'Product Title'),
      validator: (String value) {
        if (value.isEmpty) {
          return "Title is Required";
        }
        if (value.length < 5) {
          return "Title must be atleast 5 characters long";
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? '' : product.description,
      decoration: InputDecoration(labelText: "Product Description"),
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      validator: (String value) {
        if (value.isEmpty) {
          return "Description is Required";
        }
        if (value.length < 5) {
          return "Description must be atleast 10 characters long";
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField(Product product) {
    return TextFormField(
      initialValue:
          product == null ? '' : product.price.toString(),
      decoration: InputDecoration(labelText: 'Product Price (\$)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return "Price is Required";
        }
        if (!RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return "Enter a Number";
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product product) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth =
        deviceWidth > 550 ? deviceWidth * 0.65 : deviceWidth * 0.95;
    final targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            margin: EdgeInsets.all(10.0),
            child: Form(
                key: _formkey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
                  children: <Widget>[
                    _buildTitleTextField(product),
                    _buildDescriptionTextField(product),
                    _buildPriceTextField(product),
                    SizedBox(
                      height: 20,
                    ),
                    _buildSubmitButton()
                  ],
                ))));
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: Text('Save'),
          onPressed: () => _submitForm(model.addProduct, model.updateProduct, model.selectedProductIndex));
    });
  }

  void _submitForm(Function addProduct, Function updateProduct, int selectedProductIndex) {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    if (selectedProductIndex == null) {
      addProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']));
    } else {
      updateProduct(
          Product(
              title: _formData['title'],
              description: _formData['description'],
              price: _formData['price'],
              image: _formData['image']));
    }
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
          final Widget pageContent = _buildPageContent(context, model.selectedProduct);
     return model.selectedProductIndex == null
          ? pageContent
          : Scaffold(
              appBar: AppBar(
                title: Text('Edit Product'),
              ),
              body: pageContent,
            );
    });
  }
}

import 'package:flutter_course/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products {
    //Getter Method
    // List.from() gives a new pointer to the same instance of _products
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct{
        if (_selectedProductIndex == null){
      return null;
    }
    return products[_selectedProductIndex];
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
  }

  // void toggleProductFavouriteStatus(){
  //   final bool isCurrentlyFavorite = _products[_selectedProductIndex].isFavorite;
  //   final bool newFavouriteStatus = !isCurrentlyFavorite;
  //   final
  // }

  void selectProduct(int index) {

    _selectedProductIndex = index;
  }
}

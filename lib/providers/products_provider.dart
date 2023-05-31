import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/product_model.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      pID: 'p1',
      oID: 'o1',
      title: 'white Shirt',
      description: 'A white shirt - it is pretty white!',
      price: 29.99,
      imageSrc:
          'https://images.unsplash.com/photo-1581655353564-df123a1eb820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    ),
    ProductModel(
      pID: 'p2',
      oID: 'o1',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageSrc:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModel(
      pID: 'p3',
      oID: 'o1',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageSrc:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModel(
      pID: 'p4',
      oID: 'o1',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageSrc:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    ProductModel(
      pID: 'p5',
      oID: 'o1',
      title: 'black Shirt',
      description: 'A black shirt - it is pretty black!',
      price: 29.99,
      imageSrc:
          'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    ),
    ProductModel(
      pID: 'p6',
      oID: 'o1',
      title: 'Red Shoes',
      description: 'A nice pair of Shoes.',
      price: 59.99,
      imageSrc:
          'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=398&q=80',
    ),
    ProductModel(
      pID: 'p7',
      oID: 'o1',
      title: 'camera lens',
      description: 'camera lens camera lens camera lens ',
      price: 29.99,
      imageSrc:
          'https://images.unsplash.com/photo-1617005082133-548c4dd27f35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    ),
    ProductModel(
      pID: 'p8',
      oID: 'o1',
      title: 'headphones',
      description: 'Nice headphones for personal use',
      price: 59.99,
      imageSrc:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
    ProductModel(
      pID: 'p9',
      oID: 'o1',
      title: 'Perfume set',
      description: 'Perfume set Perfume set Perfume set Perfume set ',
      price: 19.99,
      imageSrc:
          'https://images.unsplash.com/photo-1611930022073-b7a4ba5fcccd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    ),
    ProductModel(
      pID: 'p10',
      oID: 'o1',
      title: 'smart watch',
      description: 'A smart watch that can be linked to a mobile phone',
      price: 49.99,
      imageSrc:
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    ),
    ProductModel(
      pID: 'p11',
      oID: 'o1',
      title: 'Red set ',
      description: 'Red set Red set Red setRed setRed setRed set',
      price: 29.99,
      imageSrc:
          'https://images.unsplash.com/photo-1522273400909-fd1a8f77637e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80',
    ),
    ProductModel(
      pID: 'p12',
      oID: 'o1',
      title: 'joystick',
      description: 'joystick joystick joystick joystick joystick.',
      price: 59.99,
      imageSrc:
          'https://images.unsplash.com/photo-1612287230202-1ff1d85d1bdf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80',
    ),
  ];

  final List<ProductModel> _userProduct = [
    ProductModel(
      pID: 'p1',
      oID: 'o1',
      title: 'white Shirt',
      description: 'A white shirt - it is pretty white!',
      price: 29.99,
      imageSrc:
          'https://images.unsplash.com/photo-1581655353564-df123a1eb820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    ),
    ProductModel(
      pID: 'p2',
      oID: 'o1',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageSrc:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModel(
      pID: 'p3',
      oID: 'o1',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageSrc:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModel(
      pID: 'p4',
      oID: 'o1',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageSrc:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<ProductModel> get products => _products;

  List<ProductModel> get userProduct => _userProduct;

  List<ProductModel> get favoritesProducts {
    return _products.where((element) => element.isFavorit).toList();
  }

  ProductModel getProductByID(String id) {
    return _products.singleWhere((element) => element.pID == id);
  }

  void addNewProduct(ProductModel product) {
    //apiClient.PostData(AppConstants.postProductURL, data);

    _products.insert(0, product);
    _userProduct.insert(0, product);
    notifyListeners();
  }

  void deleteProduct(ProductModel product) {
    _products.removeWhere((element) => element.title == product.title);
    _userProduct.removeWhere((element) => element.title == product.title);
    notifyListeners();
  }

  void editProduct(ProductModel product) {
    int index =
        _userProduct.indexWhere((element) => element.pID == product.pID);

    _userProduct[index] = product;
    int index2 = _products.indexWhere((element) => element.pID == product.pID);
    _products[index2] = product;
    notifyListeners();
  }
}

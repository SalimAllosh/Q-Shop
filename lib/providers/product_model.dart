import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  final String pID;
  late final String oID;
  final String title;
  final String description;
  final double price;
  final String imageSrc;
  bool isFavorit;

  ProductModel(
      {required this.pID,
      required this.oID,
      required this.title,
      required this.description,
      required this.price,
      required this.imageSrc,
      this.isFavorit = false});

  void toggleIsFavoritStatus() {
    isFavorit = !isFavorit;
    notifyListeners();
  }
}

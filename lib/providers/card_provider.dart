import 'package:flutter/widgets.dart';
import 'package:shop_app/models/card_item_model.dart';

class CardProvider with ChangeNotifier {
  Map<String, CardItemModel> _cardItems = {};

  Map<String, CardItemModel> get cardItem => _cardItems;

  int get numberOfProducts {
    return _cardItems.length;
  }

  int get totlaQuantity {
    int quantity = 0;
    _cardItems.forEach((key, value) {
      quantity = quantity + value.quantity;
    });

    return quantity;
  }

  double get totlaPrice {
    double price = 0.0;
    _cardItems.forEach((key, value) {
      price = price + value.price * value.quantity;
    });

    return price;
  }

  void additemToCard(String id, String title, double price) {
    if (_cardItems.containsKey(id)) {
      _cardItems.update(
          id,
          (exestedItem) => CardItemModel(exestedItem.id, exestedItem.title,
              exestedItem.price, exestedItem.quantity + 1));
    } else {
      _cardItems.putIfAbsent(id, () => CardItemModel(id, title, price, 1));
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    _cardItems.removeWhere((key, value) => key == id);
    notifyListeners();
  }

  void undoAddingItem(String id) {
    if (!_cardItems.containsKey(id)) {
      return;
    } else if (_cardItems[id]!.quantity > 1) {
      _cardItems.update(
          id,
          (currentItem) => CardItemModel(currentItem.id, currentItem.title,
              currentItem.price, currentItem.quantity - 1));
    } else {
      _cardItems.remove(id);
    }
    notifyListeners();
  }

  int getQuantityByID(String id) {
    if (_cardItems.containsKey(id)) {
      return _cardItems[id]!.quantity;
    } else {
      return 0;
    }
  }

  void clear() {
    _cardItems = {};
    notifyListeners();
  }
}

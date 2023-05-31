import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/order_model.dart';
import '../models/card_item_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  // Map<String, CardItemModel> _cardItems = {};

  void addOrder(List<CardItemModel> items, totalPrice, itemsQuantity) {
    final order = OrderModel(
        items: items,
        itemsQuantity: itemsQuantity,
        totalPrice: totalPrice,
        time: DateTime.now());
    _orders.add(order);
    notifyListeners();
  }
}

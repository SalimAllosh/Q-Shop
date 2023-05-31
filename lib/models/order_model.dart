import 'package:shop_app/models/card_item_model.dart';

class OrderModel {
  static int id = 0;
  final List<CardItemModel> items;
  final int itemsQuantity;
  final double totalPrice;
  final DateTime time;

  OrderModel({
    required this.items,
    required this.itemsQuantity,
    required this.totalPrice,
    required this.time,
  }) {
    id = id++;
  }
  static void clear() {
    id = 0;
  }

  int get orderid => id;
}

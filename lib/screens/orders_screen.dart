import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:shop_app/widgets/order_expanded_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context, listen: false).orders;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: AppTextsStyles.header2,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
        color: AppColors.backGroundColor,
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) =>
              OrderExpandedInfoCard(order: orders[index]),
        ),
      ),
    );
  }
}

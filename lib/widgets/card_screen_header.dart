import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card_provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimentions.dart';
import '../utils/app_texts_styles.dart';

class CardScreenInfoCard extends StatelessWidget {
  const CardScreenInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardProvider>(context);
    return Card(
      color: AppColors.activeColor,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppDimensions.X_Percent_Width(1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total : ",
              style: AppTextsStyles.onActiveTextStyle,
            ),
            Chip(
              backgroundColor: AppColors.primarylightColor,
              label: Text(
                "\$ ${card.totlaPrice.toStringAsFixed(3)}",
                style: AppTextsStyles.onActiveTextStyle,
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.primaryButtonBackGround)),
                  onPressed: () {
                    if (card.totlaPrice > 0) {
                      Provider.of<OrderProvider>(context, listen: false)
                          .addOrder(
                              Provider.of<CardProvider>(context, listen: false)
                                  .cardItem
                                  .values
                                  .toList(),
                              Provider.of<CardProvider>(context, listen: false)
                                  .totlaPrice,
                              Provider.of<CardProvider>(context, listen: false)
                                  .totlaQuantity);
                      Provider.of<CardProvider>(context, listen: false).clear();

                      Navigator.pushNamed(context, AppRoutes.getOrdersScreen());
                    }
                  },
                  child: Text(
                    "Order Now",
                    style: AppTextsStyles.onActiveTextStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

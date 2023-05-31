import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card_provider.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimentions.dart';
import '../utils/app_texts_styles.dart';

class CardItemDetails extends StatelessWidget {
  const CardItemDetails({
    Key? key,
    required this.id,
    required this.totalPrice,
    required this.title,
    required this.individualPrice,
    required this.quantity,
  }) : super(key: key);
  final String id;
  final double totalPrice;
  final double individualPrice;
  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensions.X_Percent_Width(1)),
      child: Dismissible(
        key: ValueKey(id),
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Alert"),
              content: Text(
                  "Are you sure that you want to delete $title from card..."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: const Text("Confirm"),
                )
              ],
            ),
          );
        },
        onDismissed: (direction) {
          Provider.of<CardProvider>(context, listen: false).deleteItem(id);
        },
        background: Container(
          margin: EdgeInsets.symmetric(
              vertical: AppDimensions.X_Percent_Width(0.4)),
          decoration: BoxDecoration(
              color: AppColors.errorColor,
              borderRadius: BorderRadius.circular(4)),
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: AppDimensions.X_Percent_Width(1)),
            child: Icon(
              Icons.delete_sweep_outlined,
              semanticLabel: "delete",
              size: AppDimensions.X_Percent_Width(5),
              color: AppColors.backGroundColor,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        child: Card(
          margin: EdgeInsets.symmetric(
              vertical: AppDimensions.X_Percent_Width(0.4), horizontal: 0),
          child: ListTile(
            leading: Container(
              width: AppDimensions.X_Percent_Width(5),
              height: AppDimensions.X_Percent_Width(5),
              decoration: BoxDecoration(
                  color: AppColors.primarylightColor,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.meduimRadius)),
              child: Center(
                child: Text(
                  "\$ $totalPrice",
                  style: AppTextsStyles.onActiveTextStyle,
                ),
              ),
            ),
            title: Text(title, style: AppTextsStyles.onActiveTextStyle),
            subtitle: Text(individualPrice.toString()),
            trailing:
                Text("X $quantity", style: AppTextsStyles.onActiveTextStyle),
          ),
        ),
      ),
    );
  }
}

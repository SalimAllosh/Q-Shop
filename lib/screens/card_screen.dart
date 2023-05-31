// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card_provider.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';

import '../widgets/card_item_detailes.dart';
import '../widgets/card_screen_header.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Card",
          style: AppTextsStyles.header2,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
        color: AppColors.backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardScreenInfoCard(),
            Expanded(
              child: ListView.builder(
                itemCount: card.numberOfProducts,
                itemBuilder: (context, index) {
                  return CardItemDetails(
                    id: card.cardItem.values.toList()[index].id,
                    totalPrice: card.cardItem.values.toList()[index].price *
                        card.cardItem.values.toList()[index].quantity,
                    title: card.cardItem.values.toList()[index].title,
                    individualPrice: card.cardItem.values.toList()[index].price,
                    quantity: card.cardItem.values.toList()[index].quantity,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

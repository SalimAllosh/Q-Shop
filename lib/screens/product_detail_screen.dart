import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_model.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)!.settings.arguments as String;

    ProductModel product = Provider.of<ProductsProvider>(context, listen: false)
        .getProductByID(productid);

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: AppDimensions.Y_Percent_height(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.imageSrc), fit: BoxFit.fill),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
            decoration: BoxDecoration(
                color: AppColors.primaryColorShade1,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            height: AppDimensions.Y_Percent_height(14.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.description,
                  style: AppTextsStyles.header2,
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.primarylightColor,
                  indent: AppDimensions.X_Percent_Width(5),
                  endIndent: AppDimensions.X_Percent_Width(5),
                ),
                Chip(
                  backgroundColor: AppColors.activeColor,
                  label: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Price : ",
                            style: AppTextsStyles.onActiveTextStyle),
                        TextSpan(
                            text: product.price.toStringAsFixed(2),
                            style: AppTextsStyles.onActiveTextStyle)
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: AppColors.primarylightColor),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

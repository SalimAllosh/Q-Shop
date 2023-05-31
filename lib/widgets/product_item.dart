// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:shop_app/widgets/shopping_card_badge.dart';
import '../providers/product_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimentions.dart';

class productItem extends StatelessWidget {
  const productItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.primarydarkColor.withOpacity(0.9),
          leading: GestureDetector(
            onTap: () {
              Provider.of<CardProvider>(context, listen: false)
                  .additemToCard(product.pID, product.title, product.price);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${product.title} Added To Shopping Card ...",
                    style: AppTextsStyles.snackBarTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  action: SnackBarAction(
                    label: "\" Undo \"",
                    onPressed: () {
                      Provider.of<CardProvider>(context, listen: false)
                          .undoAddingItem(product.pID);
                    },
                  ),
                ),
              );
            },
            child: ShoppingCartBadge(
              number: Provider.of<CardProvider>(context)
                  .getQuantityByID(product.pID),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              product.toggleIsFavoritStatus();
            },
            icon: product.isFavorit == false
                ? Icon(Icons.favorite_border_rounded,
                    color: Theme.of(context).colorScheme.secondary)
                : Icon(Icons.favorite,
                    color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.getproductDetailesScreen(),
                arguments: product.pID);
          },
          child: Image(
            image: NetworkImage(product.imageSrc),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

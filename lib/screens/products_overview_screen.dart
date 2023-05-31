import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card_provider.dart';
import 'package:shop_app/providers/user_model_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/widgets/number_on_Icon.dart';

import '../widgets/drawer.dart';
import '../widgets/products_gridView.dart';

enum FilterOptions {
  all,
  favorites,
}

class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  bool favoritFilter = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Shopping App",
            ),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == FilterOptions.all) {
                    favoritFilter = false;
                  } else {
                    favoritFilter = true;
                  }
                });
              },
              icon: Icon(Icons.filter_alt_outlined,
                  color: favoritFilter
                      ? Theme.of(context).colorScheme.secondary
                      : AppColors.primarylightColor),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text("All"),
                ),
                const PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text("Favorites"),
                )
              ],
            ),
            Consumer<CardProvider>(
              builder: (context, card, child) => GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.getCardScreen()),
                child: NumberOnIcon(
                  num: card.numberOfProducts,
                  icon: Icons.shopping_cart_rounded,
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: AppColors.backGroundColor,
          padding: EdgeInsets.fromLTRB(
              AppDimensions.X_Percent_Width(1),
              AppDimensions.X_Percent_Width(1),
              AppDimensions.X_Percent_Width(1),
              0),
          child: ProductsGridView(
            favoritfilter: favoritFilter,
          ),
        ),
      ),
    );
  }
}

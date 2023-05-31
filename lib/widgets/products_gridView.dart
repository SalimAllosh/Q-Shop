// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_model.dart';
import '../providers/products_provider.dart';
import '../utils/app_dimentions.dart';
import 'product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key? key,
    required this.favoritfilter,
  }) : super(key: key);
  final bool favoritfilter;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context, listen: false);
    final List<ProductModel> products =
        favoritfilter ? productsData.favoritesProducts : productsData.products;
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: AppDimensions.X_Percent_Width(1),
          mainAxisSpacing: AppDimensions.X_Percent_Width(1)),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: const productItem(),
      ),
    );
  }
}

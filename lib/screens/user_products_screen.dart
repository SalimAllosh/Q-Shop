import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:shop_app/widgets/drawer.dart';

import '../providers/product_model.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products =
        Provider.of<ProductsProvider>(context).userProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Products",
          style: AppTextsStyles.header2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.getuserAddAndEditProductsScreen(),
                arguments: "",
              );
            },
            icon: Icon(
              Icons.add,
              color: AppColors.primarylightColor,
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: Container(
        padding: EdgeInsets.only(left: AppDimensions.X_Percent_Width(1)),
        // margin: EdgeInsets.only(bottom: 20),
        color: AppColors.backGroundColor,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(products[index].imageSrc),
                    backgroundColor: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: AppDimensions.X_Percent_Width(1),
                  ),
                  Text(
                    products[index].title,
                    //style: AppTextsStyles.onShoppingCardTextStyle,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                AppRoutes.getuserAddAndEditProductsScreen(),
                                arguments: products[index].pID);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: const Text("Confirmation"),
                                      content: RichText(
                                        text: TextSpan(
                                          text:
                                              'Are you Sure That you want to delete  ',
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: [
                                            TextSpan(
                                                text: products[index].title,
                                                style: AppTextsStyles
                                                    .onActiveTextStyle),
                                            const TextSpan(
                                                text: ' From Yor Product ..'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Provider.of<ProductsProvider>(
                                                    context,
                                                    listen: false)
                                                .deleteProduct(products[index]);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text("Confirm",
                                              style: AppTextsStyles
                                                  .dialogcancelTextStyle),
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.primaryColor
                                                          .shade300)),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text(
                                            "Cansel",
                                            style: AppTextsStyles
                                                .dialogcancelTextStyle,
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          icon: Icon(
                            Icons.delete_forever,
                            color: AppColors.secoundaryColor,
                          )),
                    ],
                  )
                ],
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}

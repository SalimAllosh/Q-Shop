import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order_model.dart';
import 'package:shop_app/utils/app_colors.dart';

import '../utils/app_dimentions.dart';

class OrderExpandedInfoCard extends StatefulWidget {
  const OrderExpandedInfoCard({Key? key, required this.order})
      : super(key: key);

  final OrderModel order;

  @override
  State<OrderExpandedInfoCard> createState() => _OrderExpandedInfoCardState();
}

class _OrderExpandedInfoCardState extends State<OrderExpandedInfoCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return !_expanded
        ? Card(
            child: ListTile(
              leading: SizedBox(
                  //color: AppColors.errorColor,
                  height: double.infinity,
                  width: AppDimensions.X_Percent_Width(7.5),
                  child: const Center(child: Text("Status"))),
              title: Text(
                  DateFormat.yMMMEd().format(widget.order.time).toString()),
              subtitle:
                  Text("\$ ${widget.order.totalPrice.toStringAsFixed(3)}"),
              trailing: IconButton(
                  onPressed: () {
                    _expanded = !_expanded;
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_drop_down_rounded)),
            ),
          )
        : Card(
            child: Column(children: [
              ListTile(
                leading: SizedBox(
                    //color: AppColors.errorColor,
                    height: double.infinity,
                    width: AppDimensions.X_Percent_Width(7.5),
                    child: const Center(child: Text("Status"))),
                title: Text(
                    DateFormat.yMMMEd().format(widget.order.time).toString()),
                subtitle:
                    Text("\$ ${widget.order.totalPrice.toStringAsFixed(3)}"),
                trailing: IconButton(
                    onPressed: () {
                      _expanded = !_expanded;
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_drop_up_rounded)),
              ),
              const Divider(),
              Table(
                //   textDirection: TextDirection,
                children: [
                  TableRow(
                      decoration: BoxDecoration(color: AppColors.activeColor),
                      children: const [
                        Text(
                          "Name",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Quantity",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Price",
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ],
              ),
              SingleChildScrollView(
                child: Table(
                  //   textDirection: TextDirection,
                  children: List.generate(
                    widget.order.items.length,
                    (index) => TableRow(
                      children: [
                        Text(
                          widget.order.items[index].title,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.order.items[index].quantity.toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.order.items[index].price.toString(),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Table(
                //   textDirection: TextDirection,
                children: [
                  TableRow(
                      decoration: BoxDecoration(color: AppColors.activeColor),
                      children: [
                        const Text(
                          "",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.order.itemsQuantity.toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.order.totalPrice.toStringAsFixed(3),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Reorder"),
                  ),
                  IconButton(
                      onPressed: () {
                        _expanded = !_expanded;
                        setState(() {});
                      },
                      icon: const Icon(Icons.arrow_drop_up_rounded)),
                ],
              )
            ]),
          );
  }
}

// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/providers/product_model.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:validators/validators.dart';

class UserEditAndAddProductScreen extends StatefulWidget {
  const UserEditAndAddProductScreen({Key? key}) : super(key: key);
  @override
  State<UserEditAndAddProductScreen> createState() =>
      _UserEditAndAddProductScreenState();
}

class _UserEditAndAddProductScreenState
    extends State<UserEditAndAddProductScreen> {
  final FocusNode _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLFoucsNode = FocusNode();
  final _imageTextController = TextEditingController();
  final _form = GlobalKey<FormState>();
  ProductModel _product = ProductModel(
      oID: randomString(2),
      pID: randomString(2),
      title: "",
      description: "",
      price: 0,
      imageSrc: "");

  Map<String, String> _initValues = {
    "pID": "",
    "oID": "",
    "title": "",
    "price": "",
    "description": "",
  };
  bool _isInit = true;
  bool _isEdit = false;
  @override
  void initState() {
    super.initState();
    _imageTextController.addListener(() {
      _updateImage();
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      String productID = ModalRoute.of(context)!.settings.arguments.toString();
      if (productID != "") {
        ProductModel product =
            Provider.of<ProductsProvider>(context, listen: false)
                .getProductByID(productID);
        print("Edit ---- ");
        print(product.pID.toString());
        _initValues["pID"] = product.pID;
        _initValues["oID"] = product.oID;
        _initValues["title"] = product.title;
        _initValues["price"] = product.price.toString();
        _initValues["description"] = product.description;

        _imageTextController.text = product.imageSrc;
        _product = ProductModel(
            pID: product.pID,
            oID: Provider.of<AuthProvider>(context, listen: false).getUserID()!,
            title: product.title,
            description: product.description,
            price: product.price,
            imageSrc: product.imageSrc);
        _isEdit = true;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageURLFoucsNode.removeListener(() {
      _updateImage;
    });
    _imageURLFoucsNode.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageTextController.dispose();
    super.dispose();
  }

  _updateImage() {
    if (!_imageURLFoucsNode.hasFocus) {
      setState(() {});
    }
  }

  _saveForm() {
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (!_isEdit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${_product.title} has been Added ..",
            style: AppTextsStyles.snackBarTextStyle,
          ),
        ),
      );
      Provider.of<ProductsProvider>(context, listen: false)
          .addNewProduct(_product);
      Navigator.pop(context);
    }
    if (_isEdit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${_product.title} has been updated ..",
            style: AppTextsStyles.snackBarTextStyle,
          ),
        ),
      );
      print("is edit ");
      Provider.of<ProductsProvider>(context, listen: false)
          .editProduct(_product);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String from = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: from == ""
            ? Text(
                "Add Product",
                style: AppTextsStyles.header2,
              )
            : Text(
                "Edit Product",
                style: AppTextsStyles.header2,
              ),
        actions: [
          IconButton(
            onPressed: () => _saveForm(),
            icon: const Icon(Icons.save_rounded),
          )
        ],
      ),
      body: Container(
        color: AppColors.backGroundColor,
        padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "write The name of your Product ",
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title_rounded)),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  initialValue: _initValues['title'],
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _product = ProductModel(
                        pID: _product.pID,
                        oID: _product.oID,
                        title: value!,
                        description: _product.description,
                        price: _product.price,
                        imageSrc: _product.imageSrc);
                  },
                ),
                const Divider(),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Price",
                    label: Text("\$0.0"),
                    prefixIcon: Icon(Icons.attach_money_rounded),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  focusNode: _priceFocusNode,
                  initialValue: _initValues['price'],
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  validator: (value) {
                    if (!isFloat(value!)) {
                      return "Only numbers ";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _product = ProductModel(
                        pID: _product.pID,
                        oID: _product.oID,
                        title: _product.title,
                        description: _product.description,
                        price: double.parse(value!),
                        imageSrc: _product.imageSrc);
                  },
                ),
                const Divider(),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "detailes about your product....",
                    label: Text("Description"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description_rounded),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  focusNode: _descriptionFocusNode,
                  initialValue: _initValues['description'],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't Be Embty";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _product = ProductModel(
                        pID: _product.pID,
                        oID: _product.oID,
                        title: _product.title,
                        description: value!,
                        price: _product.price,
                        imageSrc: _product.imageSrc);
                  },
                ),
                const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _imageTextController.text.isNotEmpty
                        ? Container(
                            width: AppDimensions.X_Percent_Width(10),
                            height: AppDimensions.X_Percent_Width(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: AppDimensions.X_Percent_Width(0.2),
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.smallRadius),
                              color: AppColors.activeColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    _imageTextController.text,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : Container(
                            width: AppDimensions.X_Percent_Width(10),
                            height: AppDimensions.X_Percent_Width(10),
                            //color: AppColors.activeColor,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: AppDimensions.X_Percent_Width(0.2),
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.smallRadius),
                              color: AppColors.activeColor,
                            ),
                            child: Center(
                              child: Text(
                                "No Image enterd ",
                                style: AppTextsStyles.onActiveTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                    const VerticalDivider(),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "https//:......",
                          label: Text("URL"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.image_rounded),
                        ),
                        focusNode: _imageURLFoucsNode,
                        controller: _imageTextController,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                          setState(() {});
                        },
                        validator: (value) {
                          if (!isURL(value!)) {
                            return "Not valid Url";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _product = ProductModel(
                              pID: _product.pID,
                              oID: _product.oID,
                              title: _product.title,
                              description: _product.description,
                              price: _product.price,
                              imageSrc: value!);
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    onPressed: () => _saveForm(),
                    child: Text(
                      "Add Product",
                      style: AppTextsStyles.header2,
                    ))
              ],
            )),
      ),
    );
  }
}

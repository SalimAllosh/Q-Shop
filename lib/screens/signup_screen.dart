// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/user_model_provider.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:validators/validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FocusNode _emailFocsNode = FocusNode();
  final FocusNode _phoneFocsNode = FocusNode();
  final FocusNode _passwordFocsNode = FocusNode();
  final TextEditingController _emailtextController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordtextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();

  bool _hidePassord = true;
  bool _loading = false;
  //User user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailFocsNode.dispose();
    _phoneFocsNode.dispose();
    _passwordFocsNode.dispose();
    _emailtextController.dispose();
    _passwordtextController.dispose();
    super.dispose();
  }

  _saveForm() {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    _createUser();
  }

  _createUser() async {
    String respons = await Provider.of<AuthProvider>(context, listen: false)
        .createUser(_emailtextController.text, _passwordtextController.text,
            _userNameController.text, _phoneTextController.text);
    if (respons == "success") {
      Navigator.pushReplacementNamed(
          context, AppRoutes.getProductOverViewScreen());
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Error In SignUp"),
                content: Text(respons),
                actions: [
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColorShade3)),
                        child: Text(
                          "ok",
                          style: AppTextsStyles.dialogConfirmTextStyle,
                        )),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    _loading = Provider.of<AuthProvider>(context).isLoading;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: AppTextsStyles.header2,
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
            child: ListView(
              children: [
                Text(
                  "SignUp",
                  style: AppTextsStyles.header,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppDimensions.Y_Percent_height(1),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("Username"),
                    border: OutlineInputBorder(),
                  ),
                  controller: _userNameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocsNode);
                  },
                ),
                const Divider(),
                TextFormField(
                  controller: _emailtextController,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (!isEmail(value!)) {
                      return "Not valid Email ";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocsNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phoneFocsNode);
                  },
                ),
                const Divider(),
                TextFormField(
                  controller: _phoneTextController,
                  decoration: const InputDecoration(
                    label: Text("Phone"),
                    prefixIcon: Icon(Icons.phone_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (!isNumeric(value!)) {
                      return "Not valid number ";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  focusNode: _phoneFocsNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocsNode);
                  },
                ),
                const Divider(),
                TextFormField(
                  controller: _passwordtextController,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    prefixIcon: const Icon(Icons.password_outlined),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _hidePassord = !_hidePassord;
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_red_eye_sharp),
                    ),
                  ),
                  obscureText: _hidePassord,
                  keyboardType: TextInputType.name,
                  focusNode: _passwordFocsNode,
                ),
                SizedBox(
                  height: AppDimensions.Y_Percent_height(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.X_Percent_Width(1)),
                  child: TextButton(
                    onPressed: () {
                      _saveForm();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.primaryColorShade3)),
                    child: Text(
                      "Confirm",
                      style: AppTextsStyles.splahStartTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.Y_Percent_height(0.6),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //textBaseline: TextBaseline.ideographic,
                    children: [
                      const Text(
                        "You alredy have an account",
                        //textAlign: TextAlign.end,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.getSigninScreen()),
                        child: Text(
                          "LogIn",
                          style: AppTextsStyles.headerunderLine,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.Y_Percent_height(0.6),
                ),
              ],
            ),
          ),
        ),
        if (_loading == true) LoadingJumpingLine.square(),
      ]),
      bottomNavigationBar: SizedBox(
        height: AppDimensions.Y_Percent_height(4),
        child: Column(
          children: [
            const Text("Signup with athor accounts "),
            SizedBox(
              height: AppDimensions.Y_Percent_height(0.6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.apple)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

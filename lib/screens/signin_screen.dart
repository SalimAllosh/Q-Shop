// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:validators/validators.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final FocusNode _passwordFocsNode = FocusNode();
  final TextEditingController _emailtextController = TextEditingController();
  final TextEditingController _passwordtextController = TextEditingController();
  bool _hidePassord = true;
  bool _loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordFocsNode.dispose();
    _emailtextController.dispose();
    _passwordtextController.dispose();
    super.dispose();
  }

  _saveForm() {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      // _formKey.currentState!.
      return;
    }
    _formKey.currentState!.save();
    _loginUser();
    print("form is valid ");
  }

  _loginUser() async {
    String respons = await Provider.of<AuthProvider>(context, listen: false)
        .loginuser(_emailtextController.text, _passwordtextController.text);
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
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.getSignupScreen(), (route) => false);
            },
            icon: Icon(Icons.arrow_back)),
        title: Center(
          child: Text(
            "Welcome",
            style: AppTextsStyles.header2,
          ),
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
                  "Signin",
                  style: AppTextsStyles.header,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppDimensions.Y_Percent_height(1),
                ),
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
                        "forgot your password ",
                        //textAlign: TextAlign.end,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "change password",
                          style: AppTextsStyles.onActiveTextStyle,
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
            const Text("Signin with athor accounts "),
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

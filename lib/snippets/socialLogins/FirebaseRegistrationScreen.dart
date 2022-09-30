import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/services/LoginService.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/snippets/socialLogins/FirebaseLoginScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class FirebaseRegistrationScreen extends StatefulWidget {
  static String tag = '/FirebaseRegistrationScreen';

  @override
  FirebaseRegistrationScreenState createState() => FirebaseRegistrationScreenState();
}

class FirebaseRegistrationScreenState extends State<FirebaseRegistrationScreen> {
  bool isLoading = false;
  bool isShow = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordFocus = FocusNode();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    logout();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppTextField(
                      autoFocus: true,
                      controller: emailController,
                      decoration: inputDecoration(label: 'Email'),
                      nextFocus: passwordFocus,
                      textFieldType: TextFieldType.EMAIL,
                    ).paddingOnly(left: 16, right: 16, top: 32),
                    8.height,
                    AppTextField(
                      focus: passwordFocus,
                      textFieldType: TextFieldType.PASSWORD,
                      controller: passwordController,
                      decoration: inputDecoration(label: 'Password'),
                    ).paddingOnly(left: 16, right: 16),
                    8.height,
                    AppButton(
                      text: 'SignUp',
                      textStyle: boldTextStyle(),
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          isLoading = true;
                          setState(() {});

                          hideKeyboard(context);
                          await register();

                          isLoading = false;
                          setState(() {});
                        }
                      },
                      color: appStore.cardColor,
                    ).center().paddingOnly(top: 8),
                    8.height,
                    Text(
                      'Already have an account ?',
                      style: secondaryTextStyle(color: Colors.blue),
                    ).paddingAll(8).onTap(() {
                      FirebaseLoginScreen().launch(context);
                    }).center(),
                    Loader().visible(isLoading),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    try {
      final User? user = (await auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;

      if (user != null) {
        setState(() {
          isLoading = false;

          toast("${user.email} Successfully registered");

          emailController.clear();
          passwordController.clear();
        });

        FirebaseLoginScreen().launch(context);
      }
    } on FirebaseAuthException catch (user) {
      if (user.code == "weak password") {
        print("you have all" + user.email!);
      } else if (user.code == "email-already-in-use") {
        toast('The account already exists for that email.');
      }
    } catch (e) {
      print("email-already-in-use" + e.toString());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/services/LoginService.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class FirebaseLoginScreen extends StatefulWidget {
  static String tag = '/FirebaseLoginScreen';

  @override
  FirebaseLoginScreenState createState() => FirebaseLoginScreenState();
}

class FirebaseLoginScreenState extends State<FirebaseLoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordFocus = FocusNode();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool isShow = false;

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
      body: AppBarScroller(
        title: 'Firebase Login',
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                      ).paddingOnly(left: 16, right: 16, top: 24).visible(!isShow),
                      AppTextField(
                        focus: passwordFocus,
                        textFieldType: TextFieldType.PASSWORD,
                        controller: passwordController,
                        decoration: inputDecoration(label: 'Password'),
                      ).paddingOnly(left: 16, right: 16, top: 8).visible(!isShow),
                      16.height,
                      AppButton(
                        color: appPrimaryColor,
                        text: isShow ? 'Log Out' : 'Login',
                        textStyle: primaryTextStyle(),
                        onTap: () async {
                          if (isShow) {
                            setState(() {
                              isShow = !isShow;
                            });
                            final User user = FirebaseAuth.instance.currentUser!;
                            toast('No one has signed in.');
                            auth.signOut();
                            final String email = user.email!;
                            toast(email + ' has successfully signed out.');
                          } else {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              isLoading = true;
                              setState(() {});
                              await login();
                              isLoading = false;
                              setState(() {});
                            }
                          }
                        },
                      ).center(),
                      8.height,
                      Text("Don't have an account ?", style: secondaryTextStyle())
                          .onTap(() {
                            finish(context);
                          })
                          .center()
                          .visible(!isShow),
                      8.height,
                      Loader().visible(isLoading)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    try {
      final User? user = (await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          setValue(IsLoggedInSocialLogin, true);
          toast("successfully Login ${user.email}");
          setState(() {
            isShow = !isShow;
          });
          emailController.clear();
          passwordController.clear();
        });
      }
    } on FirebaseException catch (user) {
      if (user.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (user.code == 'wrong-password') {
        toast('Wrong password provided for that user');
      }
    } catch (user) {}
  }
}

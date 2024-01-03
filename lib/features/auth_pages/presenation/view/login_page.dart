import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/helper/widgets/default_button.dart';
import 'package:ezy_buy/core/helper/widgets/default_text_form.dart';
import 'package:ezy_buy/core/utils/constants.dart';
import 'package:ezy_buy/core/utils/widgets/app_name_shimmer.dart';
import 'package:ezy_buy/features/auth_pages/presenation/view/inner_screen/loading_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passController;
  var validate = GlobalKey<FormState>();
  bool secure = false;
  bool isLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();

    super.initState();
  }

  Future<void> _loginFct() async {
    final isValid = validate.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      validate.currentState!.save();

      try {
        setState(() {
          isLoading = true;
        });
        await AppFirebase.fireAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );
        if (!mounted) return;

        GoRouter.of(context).push(NamedRouteScreen.kRootPage);
      } on FirebaseAuthException catch (error) {
        await AppFunction.showWariningAlert(
          context: context,
          title: "An error has been occured ${error.message}",
          press: () {},
        );
      } catch (error) {
        await AppFunction.showWariningAlert(
          context: context,
          title: "An error has been occured $error",
          press: () {},
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: LoadingManager(
        isLoading: isLoading,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: validate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: CustomAppNamedShimmer()),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Hi There! 👋",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff203a6e),
                      ),
                    ),
                    const Text(
                      "Welcome back, Sign in to Your account.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultTextForm(
                      hint: "Email",
                      type: TextInputType.emailAddress,
                      secure: false,
                      validate: (value) {
                        return AppFunction.validatorEmailField(value: value);
                      },
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultTextForm(
                      hint: "Password",
                      type: TextInputType.visiblePassword,
                      secure: secure,
                      suffix: secure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      pressIcon: () {
                        setState(() {
                          secure = !secure;
                        });
                      },
                      color: Colors.black,
                      validate: (value) {
                        return AppFunction.validatorPasswordField(value: value);
                      },
                      controller: passController,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: DefaultButton(
                        text: "Login",
                        press: () async {
                          _loginFct();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .push(NamedRouteScreen.kForgetPassword);
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.grey.withOpacity(.8),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push(NamedRouteScreen.kSignUp);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

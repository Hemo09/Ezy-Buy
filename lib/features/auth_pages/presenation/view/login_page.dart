import 'package:ezy_buy/core/helper/widgets/default_button.dart';
import 'package:ezy_buy/core/helper/widgets/default_text_form.dart';
import 'package:ezy_buy/core/helper/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var validate = GlobalKey<FormState>();
  bool secure = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: validate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      if (value!.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
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
                      if (value!.isEmpty) {
                        return "password must not be empty";
                      }
                      return null;
                    },
                    controller: passController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : DefaultButton(text: "Login", press: () {})),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "Forgotten Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.teal,
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
                  SizedBox(
                    height: kBottomNavigationBarHeight + 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: SizedBox(
                              height: kBottomNavigationBarHeight,
                              child: FittedBox(child: SignInGooglButton())),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight,
                            child: FittedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: const Color.fromARGB(
                                        255, 219, 217, 217),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Guest?",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

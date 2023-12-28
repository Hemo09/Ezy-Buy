import 'package:ezy_buy/core/helper/widgets/default_button.dart';
import 'package:ezy_buy/core/helper/widgets/default_text_form.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  bool secure = false;
  bool vSecure = false;

  var passController = TextEditingController();

  var verifyPassController = TextEditingController();

  var validate = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    "Create",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Account :)",
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
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "password must not be empty";
                      }
                      return null;
                    },
                    controller: passController,
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
                    hint: "Re-Password",
                    type: TextInputType.visiblePassword,
                    secure: vSecure,
                    suffix: vSecure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    pressIcon: () {
                      setState(() {
                        vSecure = !vSecure;
                      });
                    },
                    validate: (value) {
                      if (passController.text != verifyPassController.text) {
                        return "password doesn't match";
                      }
                      return null;
                    },
                    controller: verifyPassController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : DefaultButton(text: "Sign up", press: () {})),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey.withOpacity(.8),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(NamedRouteScreen.kLogin);
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
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

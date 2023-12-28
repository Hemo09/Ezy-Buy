import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/helper/widgets/default_button.dart';
import 'package:ezy_buy/core/helper/widgets/default_text_form.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;
  var validate = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Form(
            key: validate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.forgotPassword,
                  height: size.height * .3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please enter the email address you'd like your password reset information sent to",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextForm(
                    controller: emailController,
                    validate: (value) {
                      return AppFunction.validatorEmailField(value: value);
                    },
                    prefix: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                    hint: "emailaddress@example.com"),
                const SizedBox(
                  height: 40,
                ),
                DefaultButton(
                    press: () {
                      validate.currentState!.validate();
                    },
                    text: "Request Link"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

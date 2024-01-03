import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/helper/widgets/default_button.dart';
import 'package:ezy_buy/core/helper/widgets/default_text_form.dart';
import 'package:ezy_buy/core/helper/widgets/picked_image.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/core/utils/widgets/app_name_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  XFile? _pickedImage;
  late TextEditingController emailController;
  late TextEditingController nameController;

  bool secure = false;
  bool vSecure = false;

  late TextEditingController passController;

  late TextEditingController verifyPassController;

  var isValid = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    verifyPassController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    verifyPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: isValid,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: CustomAppNamedShimmer()),
                  const SizedBox(
                    height: 20,
                  ),
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
                  Center(
                    child: SizedBox(
                      width: size.width * .3,
                      height: size.height * .15,
                      child: PickedImage(
                        image: _pickedImage,
                        pickImage: () async {
                          await AppFunction.pickedImage(
                              context: context,
                              cameraFunction: () {},
                              galleryFunction: () {},
                              removeFunction: () {});
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DefaultTextForm(
                    hint: "Enter your name",
                    type: TextInputType.emailAddress,
                    secure: false,
                    validate: (value) {
                      return AppFunction.validatorNameField(value: value);
                    },
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 15,
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
                    validate: (value) {
                      return AppFunction.validatorPasswordField(value: value);
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
                      return AppFunction.validatorRepeatPasswordField(
                          value: value, password: passController.text);
                    },
                    controller: verifyPassController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : DefaultButton(
                            text: "Sign up",
                            press: () async {
                              if (isValid.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                AuthFunction.signUpUser(
                                    email: emailController.text,
                                    password: passController.text);
                                GoRouter.of(context)
                                    .push(NamedRouteScreen.kRootPage);
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }),
                  ),
                  const SizedBox(
                    height: 15,
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

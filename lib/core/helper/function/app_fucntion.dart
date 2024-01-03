import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppFunction {
  static Future<void> pickedImage({
    required BuildContext context,
    required Function() cameraFunction,
    required Function() galleryFunction,
    required Function() removeFunction,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: AlertDialog(
            backgroundColor: const Color(0xffe2edf2),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Text(
                    "Choose Option",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                      onPressed: () {
                        cameraFunction();
                        if (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        }
                      },
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Camera",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                      onPressed: () {
                        galleryFunction();
                        if (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        }
                      },
                      icon: const Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Gallery",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                      onPressed: () {
                        removeFunction();
                        if (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        }
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "remove",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showWariningAlert({
    required BuildContext context,
    required String title,
    bool isError = false,
    required Function()? press,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.warning,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          )),
                    ),
                    TextButton(
                        onPressed: press,
                        child: const Text(
                          "ok",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ))
                  ],
                ),
              ],
            ),
          );
        });
  }

  static String? validatorNameField({String? value}) {
    if (value == null || value.isEmpty) {
      return "Name Must not be empty";
    } else if (value.length < 3 || value.length > 20) {
      return "Name Must be between 3 and 20 characters";
    }
    return null;
  }

  static String? validatorEmailField({String? value}) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatorPasswordField({String? value}) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validatorRepeatPasswordField(
      {String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static void showToast({required String text}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class AuthFunction {
  static Future<UserCredential?> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential =
          await AppFirebase.fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = AppFirebase.fireAuth.currentUser;
      final uid = user!.uid;
      await AppFirebase.fireStore.collection("users").doc(uid).set({
        'userId': uid,
        'userName': name,
        'userImage': "",
        'userEmail': email,
        'createdAt': Timestamp.now(),
        'userWish': [],
        'userCart': [],
      });
      AppFunction.showToast(text: "Created User");
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppFunction.showToast(text: "weak-password");
      } else if (e.code == 'email-already-in-use') {
        AppFunction.showToast(text: "email-already-in-use");
      }
    } catch (e) {
      AppFunction.showToast(text: e.toString());
    }
    return null;
  }

  static Future<UserCredential?> loginUser(
      {required String email, required String password}) async {
    try {
      final credential = await AppFirebase.fireAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppFunction.showToast(text: 'user-not-found');
      } else if (e.code == 'wrong-password') {
        AppFunction.showToast(text: 'wrong-password');
      } else {
        AppFunction.showToast(text: e.toString());
      }
    }
    return null;
  }

  static Future<dynamic> signInWithGoogle(
      {required BuildContext context}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      AppFunction.showToast(text: "Login Success");
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await GoRouter.of(context).push(NamedRouteScreen.kRootPage);
        },
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      AppFunction.showToast(text: e.toString());
    }
  }
}

import 'package:assignment/controllers/user_controller.dart';
import 'package:assignment/features/company_listing/presentation/pages/company_listing_page.dart';
import 'package:assignment/utils/helper/shared_prefs_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginViewModel extends GetxController{
  void signInWIthGoogle(BuildContext context) async{
    try {
      UserController controllerInstance = UserController();
      final user = await controllerInstance.loginWithGoogle();
      if (user != null) {
        print(user.email);
        sharedPrefs.setEmail(user.email!);
        sharedPrefs.setDisplayName(user.displayName!);
        Get.to(CompanyListingPage());
      }
    } on FirebaseAuthException catch (error) {
      print(error.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          content: Text(
            error.message ?? "Something went wrong",
          ))); // Text // SnackBar
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          content: Text(
            error.toString(),
          ))); // Text // SnackBar}
    }
  }
}
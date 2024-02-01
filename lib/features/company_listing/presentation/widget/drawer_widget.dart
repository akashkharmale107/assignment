import 'package:assignment/features/login/presentation/pages/login_screen.dart';
import 'package:assignment/utils/helper/shared_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.black,
          child: Column(
            children: [
              // Text(
              //     SharedPrefs().getDisplayName()??"",
              //     style: TextStyle(fontSize: 28,color: Colors.white)),
              ElevatedButton(onPressed: () {
                GoogleSignIn().disconnect();
                SharedPrefs().logout();
                Get.to(LoginScreen());
              }, child: Text("Sign Out"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:assignment/controllers/user_controller.dart';
import 'package:assignment/features/login/presentation/pages/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel model=Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/login_bg.png"),
                alignment: Alignment.topCenter,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Enter your Sign In Credentials",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                                fontSize: 20, color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50),
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye_outlined,
                                size: 28, color: Colors.grey.shade500),
                            hintStyle: TextStyle(
                                fontSize: 20, color: Colors.grey.shade500),
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade50,
                                ),
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width, 55),
                            backgroundColor:
                                const Color.fromRGBO(141, 47, 255, 1),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 22),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 2,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                          ),
                          Text(
                            "OR SIGN IN WITH",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                          Container(
                            height: 2,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            model.signInWIthGoogle(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/google_icon.png"),
                            maxRadius: 25,
                          )),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

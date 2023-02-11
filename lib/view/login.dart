import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authController.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
            child: GestureDetector(
              child: Row(children: const [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                Text(
                  'Salon Seç',
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
              onTap: () {
                Get.toNamed('/opening');
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 220, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[850]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white60)),
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[850]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Şifre",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white60)),
                        style: const TextStyle(color: Colors.white),
                        controller: passwordController,
                        obscureText: true,
                        showCursor: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 25,
                  ),
                  SizedBox(
                      height: Get.height / 15,
                      width: Get.width / 2,
                      child: FloatingActionButton.extended(
                          heroTag: "btn1",
                          backgroundColor: Colors.amber,
                          onPressed: () {
                            controller.login(
                                emailController.text, passwordController.text);
                          },
                          label: const Text('Giriş Yap'))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Login/login_screen.dart';
import '../View/Welcome/welcome_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Registration successful",
          backgroundColor: Colors.green);
      Get.off(const LoginScreen()); //Navigate ke Login Page
    } catch (e) {
      Get.snackbar("Error", "Error: $e", backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = true;
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAll(const WelcomeScreen());
  }
}

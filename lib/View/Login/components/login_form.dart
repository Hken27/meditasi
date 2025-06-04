import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:yoga_meditation/View/Start/start_view.dart';
import '../../../Controller/auth_signup_controller.dart';
import '../../../constants.dart';
import '../../Componen/already_have_an_account_acheck.dart';
import '../../Signup/signup_screen.dart';
import '../../Start/start_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailController,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const StartView();
                }));
              },
              child: Text(
                "Login".toUpperCase(),
              ),
              // onPressed: _authController.isLoading.value
              //     ? null
              //     : () async {
              //         try {
              //           // Lakukan perintah login di dalam try
              //           await _authController.loginUser(
              //             _emailController.text,
              //             _passwordController.text,
              //           );
              //           // ignore: use_build_context_synchronously
              //           Navigator.pushReplacement(context,
              //               MaterialPageRoute(builder: (context) {
              //             return const StartView();
              //           }));
              //           Get.snackbar('Success', 'Login successful',
              //               backgroundColor: Colors.green);
              //         } catch (error) {
              //           // Tangani kesalahan di sini, misalnya menampilkan pesan kesalahan
              //           // print('Error during login: $error');
              //           // Lakukan sesuatu jika terjadi kesalahan, seperti menampilkan pesan kepada pengguna
              //           // atau menangani kembali login yang gagal
              //           Get.snackbar('Error', 'Login failed: $error',
              //               backgroundColor: Colors.red);
              //         }
              //       },
              // child: _authController.isLoading.value
              //     ? const CircularProgressIndicator()
              //     : const Text('Login'),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

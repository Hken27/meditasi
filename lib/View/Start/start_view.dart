import 'package:flutter/material.dart';
import '../Dasboard/dashboard_view.dart';
import '../Welcome/welcome_screen.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  bool isLoggedOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 191, 197),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/dasbor.png',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Explore your journey',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'only with us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: 293,
                    child: ElevatedButton(
                      onPressed: () {
                        // pindah halaman
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const CatalogScreen();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: 293,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoggedOut = true;
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WelcomeScreen()), // Ganti dengan halaman login yang sesuai
                            (route) => false,
                          );
                          // tambahkan logika lain yang diperlukan untuk logout
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

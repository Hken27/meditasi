import 'package:flutter/material.dart';

import '../../Componen/myTheme_dashboard.dart';

class KelulusanKursus extends StatelessWidget {
  final String courseName;

  const KelulusanKursus({Key? key, required this.courseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.courseCardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: MyTheme.catalogueButtonColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Congratulations, Rendi!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            MyTheme.mediumVerticalPadding,
            Text("You have successfully completed $courseName course!",
                style: const TextStyle(fontSize: 18)),
            MyTheme.mediumVerticalPadding,
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "View Certificate",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            MyTheme.largeVerticalPadding,
            const Expanded(
              child: Image(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/graduation.png')),
            )
          ],
        ),
      ),
    );
  }
}

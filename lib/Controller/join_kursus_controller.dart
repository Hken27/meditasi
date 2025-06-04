import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class JoinController extends GetxController {
  void joinKursus() async {
    // ignore: avoid_print
    print("Berhasil join");
    await FirebaseMessaging.instance.subscribeToTopic('Yoga App');
  }
}

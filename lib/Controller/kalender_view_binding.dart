import 'package:get/get.dart';

import '../Model/Api/kalender_api.dart';

class KalenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KalenderController>(
      () => KalenderController(),
    );
  }
}

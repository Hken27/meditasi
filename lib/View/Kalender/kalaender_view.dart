import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Api/kalender_api.dart';
import '../Navbar/buttonNav_view.dart';

class HolidayListPage extends StatelessWidget {
  final KalenderController controller = Get.put(KalenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.holidays.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.holidays.length,
            itemBuilder: (context, index) {
              final holiday = controller.holidays[index];
              return ListTile(
                title: Text(holiday.name),
                subtitle: const Text("holiday.date.iso"),
              );
            },
          );
        }
      }),
      bottomNavigationBar: const ButtonNavbar(),
    );
  }
}

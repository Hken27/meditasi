import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../View/Componen/kalender_model.dart';

class KalenderController extends GetxController {
  final String apiKey = 'https://calendarific.com/api/v2';
  final String country = 'ID';
  final String year = '2023';

  var holidays = <Holiday>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://calendarific.com/api/v2'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final apiKalender = ApiKalender.fromJson(jsonResponse);
      // Sekarang, Anda dapat mengakses data dalam model Anda seperti ini:
      if (kDebugMode) {
        print(apiKalender.meta.code);
      }
      if (kDebugMode) {
        print(apiKalender.response.holidays[0].name);
      }
    } else {
      throw Exception('Gagal memuat data libur');
    }
  }
}

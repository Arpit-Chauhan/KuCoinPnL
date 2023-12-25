import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddCoinController extends GetxController with GetTickerProviderStateMixin {
  late List<String> availableCoins;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() async {
    super.onReady();
    fetchAvailableCoins();
  }

  void fetchAvailableCoins() async {
    final response = await http.get(
      Uri.parse('https://api.kucoin.com/api/v2/symbols'),
      headers: {},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      availableCoins = data.map((item) => item['symbol'].toString()).toList();
      availableCoins.sort();
      print(availableCoins);
      // print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }
}

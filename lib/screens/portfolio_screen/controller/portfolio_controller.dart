import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kucoinpnl/screens/portfolio_screen/models/tokenRes.dart';
import 'package:kucoinpnl/utils/socketManager.dart';

import '../models/coin_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart' as http;

class PortfolioController extends GetxController with GetTickerProviderStateMixin {
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  RxBool showSearchBar = false.obs;
  RxBool showFab = true.obs;
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxInt tabIndex = 0.obs;

  // List<SelectionPopupModel> sortByValue = [
  //   SelectionPopupModel(title: "High to Low", value: "desc", isSelected: true),
  //   SelectionPopupModel(title: "Low to High", value: "asc"),
  // ];

  late List<Coin> investedCoins = [];

  double totalCurrent = 0.0;
  double totalInvested = 0.0;
  double totalPnL = 0.0;
  double totalReturns = 0.0;

  // var apiKey = dotenv.env['apiKey'];
  // var apiSecret = dotenv.env['apiSecret'];
  // var passphrase = dotenv.env['passphrase'];
  final socketManager = SocketManager();

  @override
  void onInit() async {
    super.onInit();
    getAuthToken();
    investedCoins = [
      Coin(symbol: 'SHIB', name: "SHIBA INU", invested: "1400", image: "", current: "0.9", pnl: "90", returns: "10", quantity: "1000", buyAvg: "0.7"),
      Coin(
          symbol: 'LUNC',
          name: "LUNA CLASSIC",
          invested: "200",
          image: "",
          current: "34",
          pnl: "879",
          returns: "7",
          quantity: "576879",
          buyAvg: "56"),
      Coin(
          symbol: 'PEPE2', name: "PEPE2", invested: "100", image: "", current: "0.5", pnl: "23", returns: "3.4", quantity: "23232432", buyAvg: "0.2"),
      Coin(
          symbol: 'BABYDODGE',
          name: "BABYDODGE",
          invested: "100",
          image: "",
          current: "23",
          pnl: "434",
          returns: "2.6",
          quantity: "1232134",
          buyAvg: "59"),
      Coin(symbol: 'XEN', name: "XEN", invested: "200", image: "", current: "123", pnl: "43", returns: "8", quantity: "234343", buyAvg: "43")
    ];
  }

  @override
  void onReady() async {
    super.onReady();
    refreshKey.currentState?.show();
    totalCurrent =
        investedCoins.map((coin) => double.tryParse(coin.current) ?? 0.0).fold(0, (previousValue, currentValue) => previousValue + currentValue);

    totalInvested = investedCoins
        .map((coin) => (double.tryParse(coin.buyAvg) ?? 0.0) * (double.tryParse(coin.quantity) ?? 0.0))
        .fold(0, (previousValue, investedValue) => previousValue + investedValue);

    totalPnL = investedCoins.map((coin) => double.tryParse(coin.pnl) ?? 0.0).fold(0, (previousValue, pnlValue) => previousValue + pnlValue);

    totalReturns =
        investedCoins.map((coin) => double.tryParse(coin.returns) ?? 0.0).fold(0, (previousValue, returnValue) => previousValue + returnValue);
  }

  @override
  void onClose() {
    refreshKey.currentState?.dispose();
    super.onClose();
  }

  void getAuthToken() async {
    final response = await http.post(
      Uri.parse('https://api.kucoin.com/api/v1/bullet-public'),
      headers: {},
    );

    if (response.statusCode == 200) {
      TokenRes tokenRes = TokenRes.fromJson(jsonDecode(response.body));
      socketManager.connect(tokenRes.data.token);
      socketManager.subscribeToTopics(
        ['/market/ticker:SHIB-USDT'],
      );
      Future.delayed(Duration(seconds: 40)).then((value) => socketManager.onDone());
    } else {
      print('Failed to obtain a new token: ${response.body}');
    }
  }
}

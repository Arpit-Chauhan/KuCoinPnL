import 'dart:async';
import 'dart:convert';

import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  late RxList<Coin> investedCoins;

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
    socketManager.priceUpdateCallback = updateCoinPrice;
    investedCoins = [
      Coin(
          symbol: 'LUNC-USDT',
          name: "LUNA CLASSIC",
          invested: "166.079999879",
          image: "",
          current: "0.0".obs,
          pnl: "0.0".obs,
          returns: "0.0".obs,
          quantity: "11,328.8773",
          buyAvg: "0.0146598816"),
      Coin(
          symbol: 'XEN-USDT',
          name: "XEN",
          invested: "157.775999999",
          image: "",
          current: "0.0".obs,
          pnl: "0.0".obs,
          returns: "0.0".obs,
          quantity: "4,222,222.2222",
          buyAvg: "0.000037368"),
      Coin(
          symbol: 'ELON-USDT',
          name: "DOGELON",
          invested: "90.5135548643",
          image: "",
          current: "0.0".obs,
          pnl: "0.0".obs,
          returns: "0.0".obs,
          quantity: "5,641,821.9461",
          buyAvg: "0.00001604332"),
      Coin(
          symbol: 'CULT-USDT',
          name: "CULT",
          invested: "91.8355613927",
          image: "",
          current: "0.0".obs,
          pnl: "0.0".obs,
          returns: "0.0".obs,
          quantity: "	415,759.2382 ",
          buyAvg: "0.0002208864"),
      Coin(
          symbol: 'PEPE2-USDT',
          name: "PEPE2",
          invested: "83.1074563788",
          image: "",
          current: "0.0".obs,
          pnl: "0.0".obs,
          returns: "0.0".obs,
          quantity: "27,570,606.0606",
          buyAvg: "0.00000301435"),
      Coin(
          symbol: 'BABYDOGE-USDT',
          name: "BABYDODGE",
          invested: "99.648",
          image: "",
          current: "0.0".obs,
          pnl: "0.0".obs,
          returns: "0.0".obs,
          quantity: "837,404,047.4528",
          buyAvg: "0.00000011899632"),
    ].obs;
  }

  @override
  void onReady() async {
    super.onReady();
    refreshKey.currentState?.show();
    totalCurrent = investedCoins
        .map((coin) => double.tryParse(coin.current.value) ?? 0.0)
        .fold(0, (previousValue, currentValue) => previousValue + currentValue);

    totalInvested = investedCoins
        .map((coin) => (double.tryParse(coin.buyAvg) ?? 0.0) * (double.tryParse(coin.quantity) ?? 0.0))
        .fold(0, (previousValue, investedValue) => previousValue + investedValue);

    totalPnL = investedCoins.map((coin) => double.tryParse(coin.pnl.value) ?? 0.0).fold(0, (previousValue, pnlValue) => previousValue + pnlValue);

    totalReturns =
        investedCoins.map((coin) => double.tryParse(coin.returns.value) ?? 0.0).fold(0, (previousValue, returnValue) => previousValue + returnValue);
  }

  @override
  void onClose() {
    refreshKey.currentState?.dispose();
    socketManager.onDone();
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
        ['/market/ticker:LUNC-USDT', 'XEN-USDT', 'ELON-USDT', 'CULT-USDT', 'PEPE2-USDT', 'BABYDOGE-USDT', 'BTC-USDT'],
      );
      // Future.delayed(Duration(seconds: 30)).then((value) => socketManager.onDone());
    } else {
      print('Failed to obtain a new token: ${response.body}');
    }
  }

  void updateCoinPrice(String symbol, String newPrice) async {
    print('$symbol');
    String inrPrice = await convert();
    double newPriceValue = double.parse(newPrice);
    double inrPriceValue = double.parse(inrPrice);

    double multipliedValue = newPriceValue * inrPriceValue;
    String value = multipliedValue.toString();
    final Coin? coinToUpdate = investedCoins.firstWhereOrNull((coin) => coin.symbol == symbol);
    if (coinToUpdate != null) {
      coinToUpdate.current.value = value;
      coinToUpdate.pnl.value =
          ((double.parse(coinToUpdate.current.value) * double.parse(coinToUpdate.quantity.replaceAll(',', ''))) - double.parse(coinToUpdate.invested))
              .toString();
      // print('P&L: ${coinToUpdate.pnl.value}');
      coinToUpdate.returns.value = ((double.parse(coinToUpdate.pnl.value) / double.parse(coinToUpdate.invested)) * 100).toString();
      //print('Returns: ${coinToUpdate.returns.value}');
      update(); // Update the UI with the new data
    }
  }

  Future<String> convert() async {
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.usd,
      to: Currency.inr,
      amount: 1,
    );
    return usdConvert.toString();
  }
}

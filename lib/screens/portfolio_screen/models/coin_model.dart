import 'package:get/get.dart';

class Coin {
  String symbol;
  String name;
  String image;
  String invested;
  RxString current;
  RxString pnl;
  RxString returns;
  String quantity;
  String buyAvg;

  Coin({
    required this.symbol,
    required this.name,
    required this.invested,
    required this.image,
    required this.current,
    required this.pnl,
    required this.returns,
    required this.quantity,
    required this.buyAvg,
  });
}

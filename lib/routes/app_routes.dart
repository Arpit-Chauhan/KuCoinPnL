import 'package:get/get.dart';
import 'package:kucoinpnl/screens/portfolio_screen/binding/portfolio_binding.dart';
import 'package:kucoinpnl/screens/portfolio_screen/controller/portfolio_controller.dart';
import 'package:kucoinpnl/screens/portfolio_screen/portfolio_screen.dart';

import '../screens/addCoin_screen/addCoin_screen.dart';
import '../screens/addCoin_screen/binding/addCoin_binding.dart';

class AppRoutes {
  static const portfolioScreen = '/portfolio_screen';
  static const addCoinScreen = '/addCoin_screen';

  static List<GetPage> pages = [
    GetPage(
      name: portfolioScreen,
      page: () => PortfolioScreen(),
      bindings: [
        PortfolioBinding(),
      ],
    ),
    GetPage(
    name: addCoinScreen,
    page: () => AddCoinScreen(),
    bindings: [
      AddCoinBinding(),
    ],
  ),
  ];
}

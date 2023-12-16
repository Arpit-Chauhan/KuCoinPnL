import 'package:get/get.dart';
import 'package:kucoinpnl/screens/portfolio_screen/binding/portfolio_binding.dart';
import 'package:kucoinpnl/screens/portfolio_screen/controller/portfolio_controller.dart';
import 'package:kucoinpnl/screens/portfolio_screen/portfolio_screen.dart';

class AppRoutes {
  static const portfolioScreen = '/portfolio_screen';

  static List<GetPage> pages = [
    GetPage(
      name: portfolioScreen,
      page: () => PortfolioScreen(),
      bindings: [
        PortfolioBinding(),
      ],
    ),
  ];
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../controller/portfolio_controller.dart';

class PortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PortfolioController());
  }
}

import 'package:get/get.dart';
import '../controller/addCoinController.dart';

class AddCoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCoinController());
  }
}

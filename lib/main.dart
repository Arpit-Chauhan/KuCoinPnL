import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kucoinpnl/routes/app_routes.dart';
import 'package:kucoinpnl/screens/portfolio_screen/portfolio_screen.dart';

import 'utils/network_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.portfolioScreen,
      getPages: AppRoutes.pages,
    );
  }
}

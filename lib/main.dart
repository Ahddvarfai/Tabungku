import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/transaction_controller.dart';
import 'pages/home_page.dart';

void main() {
  Get.put(TransactionController());
  runApp(const TabungkuApp());
}

class TabungkuApp extends StatelessWidget {
  const TabungkuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tabungku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF167D68)),
        scaffoldBackgroundColor: const Color(0xFFF5F7F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7F6),
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}

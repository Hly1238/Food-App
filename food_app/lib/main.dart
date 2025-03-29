import 'package:flutter/material.dart';
import 'package:food_app/models/trans.dart';
import 'package:food_app/pages/navigation.dart';
import 'package:food_app/pages/onboarding.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeController());

  // await Hive.initFlutter();
  // Hive.registerAdapter(TransAdapter());
  // await Hive.deleteBoxFromDisk('transBox');
  // print("Hive: ${await Hive.boxExists('transBox')}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}

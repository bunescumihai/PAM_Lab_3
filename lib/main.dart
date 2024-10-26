import 'package:flutter/material.dart';
import 'package:lab_3/themes/custom_theme.dart';
import 'controllers/barbershop_controller.dart';
import 'screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  Get.put(BarbershopController()); // Initialize your controller here
  runApp(const BarberShopApp());
}


class BarberShopApp extends StatelessWidget {
  const BarberShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Barbershop",
      home: HomeScreen(),
      theme: CustomTheme.theme(),
    );
  }
}

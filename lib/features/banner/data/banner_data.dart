import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../models/banner.dart';

class BannerData {
  Future<Banner> fetchBanner() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    String jsonString = await rootBundle.loadString('assets/barbershop.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    dynamic bannerJson = jsonData['banner'];
    return Banner.fromJson(bannerJson);
  }
}
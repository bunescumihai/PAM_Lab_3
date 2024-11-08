import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../models/banner.dart';

class BannerController extends GetxController{

  var banner = Banner().obs;

  @override void onInit() {
    super.onInit();
    fetchBanner();
  }

  Future<void> fetchBanner() async{

    await Future.delayed(Duration(seconds: 1));

    String jsonString = await rootBundle.loadString('assets/barbershop.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    dynamic bannerJson = jsonData['banner'];

    banner.value = Banner.fromJson(bannerJson);

  }
}
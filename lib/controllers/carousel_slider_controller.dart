import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/barbershop.dart';

class CarouselSliderController1 extends GetxController{
  var slideNumber = 0.obs;
  var barberList = <Barbershop>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchBarbershops();
  }

  Future<void> fetchBarbershops() async{
    await Future.delayed(Duration(seconds: 1));

    String jsonString = await rootBundle.loadString('assets/barbershop.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> barbershopsJsonList = jsonData['most_recommended'];

    barberList.value = barbershopsJsonList.map((v) => Barbershop.fromJson(v)).toList().cast<Barbershop>();
  }

  setSlideNumber(int index){
    this.slideNumber.value = index;
  }

}
import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/barbershop.dart';

class BarbershopData {

  Future<List<Barbershop>> fetchInitialBarbershops() async {
    await Future.delayed(Duration(seconds: 2));
    String jsonString = await rootBundle.loadString('assets/barbershop.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonBarbershops = jsonData['nearest_barbershop'];
    return jsonBarbershops.map((json) => Barbershop.fromJson(json)).toList().cast<Barbershop>();
  }

  Future<List<Barbershop>> fetchAllBarbershops() async {
    await Future.delayed(Duration(seconds: 4));
    String jsonString = await rootBundle.loadString('assets/barbershop.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonBarbershops = jsonData['list'];
    return jsonBarbershops.map((json) => Barbershop.fromJson(json)).toList().cast<Barbershop>();
  }

}
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/barbershop.dart';

class BarbershopController extends GetxController {
  var barbershops = <Barbershop>[].obs;

  var barbershopsList = <Barbershop>[].obs;
  var isLoading = false.obs;
  var canLoadMore = true.obs;
  int currentIndex = 0;

  var loadingAllBarbershops = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchInitialBarbershops();
    fetchAllBarbershops();
  }

  Future<void> fetchInitialBarbershops() async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 2));

      String jsonString = await rootBundle.loadString('assets/barbershop.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> jsonBarbershops = jsonData['nearest_barbershop'];

      barbershops.value = jsonBarbershops
          .map((json) => Barbershop.fromJson(json))
          .toList()
          .sublist(0,5)
          .cast<Barbershop>();

      currentIndex = barbershops.length;
      canLoadMore.value = currentIndex < jsonBarbershops.length;
    } catch (e) {
      print("Error fetching barbershops: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMore() async {
    if (!canLoadMore.value) return;

    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 2));

      String jsonString = await rootBundle.loadString('assets/barbershop.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> jsonBarbershops = jsonData['nearest_barbershop'];

      int nextBatchIndex = currentIndex + 5;
      if (currentIndex < jsonBarbershops.length) {
        List<Barbershop> moreBarbershops = jsonBarbershops
            .sublist(currentIndex, nextBatchIndex.clamp(0, jsonBarbershops.length))
            .map((json) => Barbershop.fromJson(json))
            .toList()
            .cast<Barbershop>();

        barbershops.addAll(moreBarbershops);
        currentIndex = nextBatchIndex;

        if (currentIndex >= jsonBarbershops.length) {
          canLoadMore.value = false;
        }
      } else {
        canLoadMore.value = false;
      }
    } catch (e) {
      print("Error fetching more barbershops: $e");
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> fetchAllBarbershops() async{
    loadingAllBarbershops.value = true;

    try {
      await Future.delayed(Duration(seconds: 4));

      String jsonString = await rootBundle.loadString('assets/barbershop.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> barbershopsJsonList = jsonData['list'];

      this.barbershopsList.value = barbershopsJsonList.map((value) => Barbershop.fromJson(value)).toList().cast<Barbershop>();

      loadingAllBarbershops.value = false;
    }
    catch (e) {
      loadingAllBarbershops.value = false;
    }
    finally{
      loadingAllBarbershops.value = false;
    }
  }
}

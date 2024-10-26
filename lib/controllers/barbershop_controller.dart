import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/barbershop.dart';

class BarbershopController extends GetxController {
  var barbershops = <Barbershop>[].obs; // Observable list of barbershops

  var barbershopsList = <Barbershop>[].obs; // Observable list of barbershops
  var isLoading = false.obs; // Loading state
  var canLoadMore = true.obs; // To check if more data can be loaded
  int currentIndex = 0; // Track the current index for loading more

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
      // Simulate a network request
      await Future.delayed(Duration(seconds: 2));

      // Load initial barbershops data from JSON file (simulated)
      String jsonString = await rootBundle.loadString('assets/barbershop.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> jsonBarbershops = jsonData['nearest_barbershop'];

      // Parse JSON and convert to Barbershop objects
      barbershops.value = jsonBarbershops
          .map((json) => Barbershop.fromJson(json))
          .toList()
          .sublist(0,5)
          .cast<Barbershop>();

      // Set the initial index
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
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Load more barbershops from the original JSON data
      String jsonString = await rootBundle.loadString('assets/barbershop.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> jsonBarbershops = jsonData['nearest_barbershop'];

      // Get the next batch of barbershops
      int nextBatchIndex = currentIndex + 5;
      if (nextBatchIndex < jsonBarbershops.length) {
        List<Barbershop> moreBarbershops = jsonBarbershops
            .sublist(currentIndex, nextBatchIndex)
            .map((json) => Barbershop.fromJson(json))
            .toList()
            .cast<Barbershop>();

        barbershops.addAll(moreBarbershops);
        currentIndex = nextBatchIndex; // Update index for next fetch
      } else {
        canLoadMore.value = false; // No more data to load
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
      // Simulate network delay
      await Future.delayed(Duration(seconds: 4));

      // Load more barbershops from the original JSON data
      String jsonString = await rootBundle.loadString('assets/barbershop.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> barbershopsJsonList = jsonData['list'];

      this.barbershopsList.value = barbershopsJsonList.map((value) => Barbershop.fromJson(value)).toList().cast<Barbershop>();

      loadingAllBarbershops.value = false; // No more data to load
    }
    catch (e) {
      loadingAllBarbershops.value = false; // No more data to load
    }
    finally{
      loadingAllBarbershops.value = false; // No more data to load
    }
  }
}

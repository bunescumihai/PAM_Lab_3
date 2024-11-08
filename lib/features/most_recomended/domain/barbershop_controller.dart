import 'package:get/get.dart';
import 'package:lab_3/data/barbershop_data.dart';

import '../../../models/barbershop.dart';

class BarbershopController extends GetxController {
  final BarbershopData barbershopService;
  var barbershops = <Barbershop>[].obs;
  var barbershopsList = <Barbershop>[].obs;
  var isLoading = false.obs;
  var canLoadMore = true.obs;
  var loadingAllBarbershops = false.obs;
  int currentIndex = 0;

  BarbershopController(this.barbershopService);

  @override
  void onInit() {
    super.onInit();
    fetchInitialBarbershops();
    fetchAllBarbershops();
  }

  Future<void> fetchInitialBarbershops() async {
    isLoading.value = true;
    try {
      List<Barbershop> initialBarbershops = await barbershopService.fetchInitialBarbershops();
      barbershops.value = initialBarbershops.sublist(0, 5);
      currentIndex = barbershops.length;
      canLoadMore.value = currentIndex < initialBarbershops.length;
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
      List<Barbershop> allBarbershops = await barbershopService.fetchInitialBarbershops();
      int nextBatchIndex = currentIndex + 5;
      List<Barbershop> moreBarbershops = allBarbershops.sublist(
        currentIndex,
        nextBatchIndex.clamp(0, allBarbershops.length),
      );
      barbershops.addAll(moreBarbershops);
      currentIndex = nextBatchIndex;
      if (currentIndex >= allBarbershops.length) {
        canLoadMore.value = false;
      }
    } catch (e) {
      print("Error fetching more barbershops: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAllBarbershops() async {
    loadingAllBarbershops.value = true;
    try {
      barbershopsList.value = await barbershopService.fetchAllBarbershops();
    } catch (e) {
      print("Error fetching all barbershops: $e");
    } finally {
      loadingAllBarbershops.value = false;
    }
  }
}

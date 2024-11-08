import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:lab_3/features/most_recomended/domain/barbershop_controller.dart";
import "package:lab_3/moks/barbershops.dart";
import "package:lab_3/shared/barber_medium_card.dart";

import "../../../controllers/carousel_slider_controller.dart";
import "../../../shared/barber_big_card.dart";

class MostRecommended extends StatelessWidget{

  final BarbershopController barbershopController = Get.find<BarbershopController>();
  final CarouselSliderController1 carouselSliderController = Get.put(CarouselSliderController1());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Most Recommended",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              )),

          Obx(() {
            return CarouselSlider(
              options: CarouselOptions(
                  height: 295,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    carouselSliderController.setSlideNumber(index);
                  }),
              items: carouselSliderController.barberList.map((b) => BarberBigCard(b)).toList(),
            );
          }),

          SizedBox(height: 10),

          Obx(() {
            return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: barbershops.map((url) {
              int index = barbershops.indexOf(url);
              return Container(
                width: carouselSliderController.slideNumber.value == index ? 20 : 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: carouselSliderController.slideNumber.value == index
                      ? Color.fromRGBO(54, 48, 98, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          );}),

          Obx((){
            if(barbershopController.loadingAllBarbershops.value)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
                shrinkWrap: true,
                itemCount: barbershopController.barbershopsList.length,
                itemBuilder: (context, index) {
                  return BarberCard(barbershopController.barbershopsList[index]);
                });
          }
          )

        ],
      ),
    );
  }
}

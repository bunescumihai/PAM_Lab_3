import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../most_recomended/domain/barbershop_controller.dart';
import '../../../shared/barber_medium_card.dart';

class NearestBarbershop extends StatelessWidget {
  const NearestBarbershop({super.key});

  @override
  Widget build(BuildContext context) {
    final BarbershopController controller = Get.find<BarbershopController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Nearest Barbershop",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.barbershops.length,
            itemBuilder: (context, index) {
              return BarberCard(controller.barbershops[index]);
            },
          );
        }),
        Center(
          child: Obx(() {
            if (controller.isLoading.value) {
              return CircularProgressIndicator();
            } else {
              if(controller.canLoadMore.value)
                return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  side: BorderSide(
                    color: Color(0xFF362F62),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                  onPressed: () async {
                    await controller.fetchMore(); // Fetch more items when pressed
                  },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See More',
                      style: TextStyle(
                        color: Color(0xFF362F62),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.open_in_new,
                      color: Color(0xFF362F62),
                      size: 18,
                    ),
                  ],
                ),
              );
              else
                return SizedBox();
            }
          }),
        ),
      ],
    );
  }
}

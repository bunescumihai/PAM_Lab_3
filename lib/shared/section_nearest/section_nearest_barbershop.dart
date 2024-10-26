import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/barbershop_controller.dart'; // Import your BarbershopController
import '../../models/barbershop.dart'; // Import your Barbershop model
import '../barber_medium_card.dart'; // Import your BarberCard widget

class SectionNearestBarbershop extends StatelessWidget {
  const SectionNearestBarbershop({super.key});

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
        // Using Obx to make the ListView reactive
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
              // Show the loading spinner while fetching data
              return CircularProgressIndicator();
            } else {
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
            }
          }),
        ),
      ],
    );
  }
}


/*
class SectionNearestBarbershop extends StatelessWidget {
  const SectionNearestBarbershop({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of the controller
    final BarbershopController controller = Get.put(BarbershopController());

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
        // Using Obx to make the ListView reactive
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Prevent scrolling of inner list
            itemCount: controller.barbershops.length,
            itemBuilder: (context, index) {
              return BarberCard(controller.barbershops[index]);
            },
          );
        }),
        Center(
          child: Obx(() {
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
              onPressed: controller.currentIndex < controller.barbershops.length
                  ? () async {
                await controller.fetchMore(); // Fetch more barbershops
              }
                  : null, // Disable button if no more data
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
          }),
        ),
      ],
    );
  }
}
*/

/*
class SectionNearestBarbershop extends StatelessWidget {
  const SectionNearestBarbershop({super.key});

  @override
  Widget build(BuildContext context) {
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
            )),

        ListView.builder(
          shrinkWrap: true,
          itemCount: barbershops.length,
          itemBuilder: (context, index) {
            return BarberCard(barbershops[index]);
          },
        ),
        Center(
          child: OutlinedButton(
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
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                      color: Color(0xFF362F62),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.open_in_new,
                  color: Color(0xFF362F62), // Icon color
                  size: 18, // Adjust icon size
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/

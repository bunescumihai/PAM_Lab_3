import "package:flutter/material.dart";
import "package:lab_3/shared/header/header.dart";
import "package:lab_3/features/banner/presentation/banner.dart";
import "package:lab_3/shared/search_input.dart";
import "package:lab_3/features/most_recomended/presentation/most_recommended.dart";
import "package:lab_3/features/nearest_barbershop/presentation/nearest_barbershop.dart";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Header(),
                  SearchInput(),
                  NearestBarbershop(),
                  MostRecommended()
                ],
              ),
            ),
          )
    );
  }
}

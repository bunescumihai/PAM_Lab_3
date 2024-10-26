import "package:flutter/material.dart";
import "package:lab_3/shared/header/header.dart";
import "package:lab_3/shared/header/intro.dart";
import "package:lab_3/shared/search_input.dart";
import "package:lab_3/shared/section_most_recomended/section_most_recommended.dart";
import "package:lab_3/shared/section_nearest/section_nearest_barbershop.dart";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15), 
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SearchInput(),
                SectionNearestBarbershop(),
                SectionMostRecommended()
              ],
            ),
          )
    ));
  }
}

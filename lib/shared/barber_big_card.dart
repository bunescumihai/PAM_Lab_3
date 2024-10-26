import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import "../models/barbershop.dart";

class BarberBigCard extends StatelessWidget {
  const BarberBigCard(this._barbershop, {super.key});

  final Barbershop _barbershop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: double.infinity,
              height: 225,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  _barbershop.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: TextButton(
                    style: ButtonStyle(
                      padding:  WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 8)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(54, 48, 98, 1))),
                    onPressed: () {},
                    child: Text(
                      "Booking",
                      style: TextStyle(color: Colors.white),
                    )))
          ]),
          Text(
            _barbershop.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.locationDot,
                size: 13,
                color: Color.fromRGBO(134, 131, 161, 1),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(_barbershop.location,
                      style: Theme.of(context).textTheme.labelSmall)),
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.solidStar,
                size: 13,
                color: Color.fromRGBO(134, 131, 161, 1),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(_barbershop.rating.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.labelSmall)),
            ],
          ),
        ],
      ),
    );
  }
}

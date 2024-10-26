import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:lab_3/models/barbershop.dart";

class BarberCard extends StatelessWidget {
  BarberCard(this._barbershop, {super.key});

  final Barbershop _barbershop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(_barbershop.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        _barbershop.title,
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.start,
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationDot,
                          size: 13,
                          color: Color.fromRGBO(134, 131, 161, 1),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: Text(_barbershop.location,
                                style: Theme.of(context).textTheme.labelSmall)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidStar,
                        size: 13,
                        color: Color.fromRGBO(134, 131, 161, 1),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 3),
                          child: Text(_barbershop.rating.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.labelSmall)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/user.dart';

class UserSimple extends StatelessWidget {
  const UserSimple(this._user, {super.key});

  final User _user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      size: 13,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Text(_user.location, style: Theme.of(context).textTheme.labelMedium)),
                  ],
                ),
                Text(
                  _user.fullName,
                  style: Theme.of(context).textTheme.titleSmall
                )
              ],
            )),
        CircleAvatar(
          backgroundImage: AssetImage(_user.imagePath),
        )
      ],
    );
  }
}
